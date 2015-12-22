import sys
import re
import pprint
import glob
from initd import INITD, REPLACEMENTS
import string
 
keys = {} #store for all bibtex keys
excludefields = ['language'] #fields not to output

#prepare translation table for removing non-ASCII
orig = ''
trans = ''
for k in INITD:
  s = INITD[k]
  for c in s:
    orig+=c
    trans+=k
transtable = str.maketrans(orig, trans)
    

class Record(): 
  """
  A bitex record
  """

  TYPKEYFIELDS = r"^([^\{]+)\{([^,]+),[\s\n\t]*((?:.|\n)*)\}"

  def __init__(self,s,inkeysd={},restrict=False):  
    """
    :param s: the bibtexrecord as a string
    :type s: string or unicode
    :param inkeys: keys which should be included in the output
    :type inkeys: list of strings 
    :param restrict: whether the output bibfile should be restricted to inkeys
    :type restrict: Boolean    
    """
    
    #analyze first line
    m = re.match(self.TYPKEYFIELDS,s)
    self.typ = m.group(1).lower()
    self.key = m.group(2)
    
    #analyze remainder
    try: 
      self.fields = dict((tp[0].strip()\
          .replace('\n',' ')\
          .replace('\t',' '),
          tp[1].strip()\
          .replace('\n',' ')\
          .replace('\t',' ')
            ) for tp in [re.split('\s*=\s*',t,maxsplit=1) 
        for t in re.split('(?<=\})\s*,\s*\n',
              m.group(3).strip()
              )
        ]
            )
    except IndexError:
      print(s) 
    #store keys 
    self.inkeysd = inkeysd
    self.restrict = restrict
    self.errors = [] #accumulates all error messages
    if self.key in keys:
      self.errors.append("duplicate key %s"% self.key)
    keys[self.key] = True
    self.conform() 
    self.report()
    
  def conform(self):
    """
    analyze fields, report errors and correct as necessary
    """
    
    if self.fields.get('editor') != None and self.fields.get('booktitle') == None:
      try:      
        self.fields['booktitle'] = self.fields['title'] 
      except KeyError:
        self.errors.append("neither title nor booktitle")
    pages = self.fields.get('pages')
    if pages != None: 
      self.fields['pages'] = re.sub(r'([0-9])-([0-9])',r'\1--\2',pages)		 
    self.conformsubtitles() 
    self.conforminitials()
    self.checkand()
    self.checkedition()
    self.checkurl()
    self.checkurldate()
    self.checkquestionmarks()
    self.checkarticle()
    self.checkbook()
    self.checkincollection()
  
  def report(self):
    """
    print errors, if any
    """
    
    if len(self.errors)>0:
      if restrict==False or self.inkeysd.get(self.key):
        print(self.key,'\n  '.join(['  ']+self.errors))
 
      
  def upperme(self,match):
    """
    substitute a regex match with uppercase
    """
    
    return match.group(1) + ' {' +match.group(2).upper()+'}'

 
      
  def conformsubtitles(self):
    """
    uppercase and protect first word of subtitle
    """
    
    for t in ('title','booktitle'):
      if self.fields.get(t) != None: 
        self.fields[t] = re.sub(r'([:\.\?!]) *([a-zA-Z])', self.upperme ,self.fields[t])
      
  def conforminitials(self):
    """
    make sure that initials have a space between them
    """
    
    for t in ('author','editor'):
      if self.fields.get(t) != None: 
        self.fields[t] = re.sub(r'([A-Z])\.([A-Z])', r'\1. \2',self.fields[t])
        
  def checkand(self):
    """
    check whether commas are used instead of 'and' (asyndetic coordination)
    """
    
    for t in ('author','editor'):
      if self.fields.get(t) != None: 
        ands = self.fields[t].count(' and ')
        commas = self.fields[t].count(',')
        if commas > ands +1:
          self.errors.append("problem with commas in %s: %s"% (t,self.fields[t]))
          
  def checkedition(self):
    """
    check for the correct formatting of the edition field
    """
    
    edn =  self.fields.get('edition')
    if edn:
      edn = edn.replace('{','').replace('}','').replace('"','').strip()
      try:
        int(edn)
      except ValueError:
          self.errors.append("incorrect format for edition: %s"% (edn))
          
  def checkurl(self): 
    """
    make sure the url field contains the url and only the url
    """
    url = self.fields.get('url','')
    if self.fields.get('url','').count(' ')>0:
      self.errors.append("space in url")
    nonsites = ('ebrary','degruyter','doi','myilibrary','academia','ebscohost')
    for n in nonsites:
      if n in url:
        self.errors.append("%s: urls should only be given for true repositories or for material not available elsewhere"%url)
                
  def checkurldate(self): 
    """
    make sure the urldate field is only present when an url is actually given
    """
    
    if self.fields.get('urldate') != None:
      if self.fields.get('url') == None:
        self.errors.append("urldate without url")
      
          
  def checkbook(self):
    """
    perform some check for type book 
    """
    
    if self.typ != 'book':
      return 
    mandatory = ('year', 'title', 'address', 'publisher')
    for m in mandatory:
      self.handleerror(m)
    if self.fields.get('series') != None: 
      #people often mix up the field 'number' and 'volume' for series
      #if both are present, we leave everything as is
      #if only volume is present, we assign the content to 
      #number and delete the field volume
      number = self.fields.get('number')
      volume = self.fields.get('volume')
      if volume != None:
        if number == None:
          self.fields['number'] = volume
          del self.fields['volume'] 
    #books should have either author or editor, but not both or none
    auth = self.fields.get('author')
    ed = self.fields.get('editor')     
    if auth:
      if ed:
        self.errors.append("both author and editor")
      else:
        self.addsortname(auth)
    elif ed:
      self.addsortname(ed)
    else:
      self.errors.append("neither author nor editor")        
      
  def addsortname(self,name):
    #print(name)
    residue = name.translate({ord(i):None for i in string.ascii_letters+'- ,{}'})
    if residue == '':
      pass
    else:
      #print(residue)
      sortname = name
      #remove legacy diacritics
      replacements="""'"`~vk=^"""
      for r in replacements:
        s = '\\%s'%r 
        sortname = sortname.replace(s,'')
      #replace higher Unicode with nearest low ASCII equivalent
      sortname = sortname.translate(transtable) 
      #update fields 
      self.fields['sortname'] = sortname
      

      
  def checkarticle(self):
    """
    perform some checks for type article
    """
    if self.typ != 'article':
      return 
    mandatory = ('author', 'year', 'title', 'journal', 'volume', 'pages') 
    for m in mandatory:
      self.handleerror(m)
    auth = self.fields.get('author')
    if auth:
      self.addsortname(auth)
      
  def checkincollection(self):
    """
    perform some checks for type incollection
    """
    if self.typ != 'incollection':
      return 
    mandatory = ('author', 'year', 'title', 'pages')
    for m in mandatory:
      self.handleerror(m)
    if self.fields.get('crossref'):
      #the content is available in the crossref'd record
      return
    mandatory2 = ('booktitle', 'editor', 'publisher', 'address')
    for m2 in mandatory2:
      self.handleerror(m2)
    auth = self.fields.get('author')
    if auth:
      self.addsortname(auth)
      
  def checkquestionmarks(self):
    """
    check for fields with ??, which are not to be printed
    """ 
    
    for field in self.fields:
      if '??' in self.fields[field]:
        self.errors.append("?? in %s" % field)
        
      
  def handleerror(self,m):
    """
    check whether a mandatory field is present
    replace with error mark if not present
    """
    if self.fields.get(m) == None:
      self.fields[m] = r"{\biberror{no %s}}" % m
      self.errors.append("missing %s"%m) 
      
		
    
    
  def bibtex(self): 
    """
    recreate the bibtex record
    output fields will be sorted alphabetically
    remove all fields which are in excludefields
    """ 
    
    if self.restrict and not self.inkeysd.get(self.key):
      return False
    s = """@%s{%s,\n\t%s\n}"""%(self.typ,
        self.key,
        ",\n\t".join(
                                              ["%s = %s" %(f,self.fields[f]) 
                                              for f in sorted(self.fields.keys())
                                              if f not in excludefields
                                              ]
                                            )
                                  )
    return s
    


if __name__ == "__main__":    
  """
  usage: python3 normalizebib.py localbibliography.bib 
  """

  inbib = open(sys.argv[1])
  outbib = open('sorted.bib','w')
  texs = glob.glob('chapters/*tex')
  CITE = re.compile(r'\cite[yeargenltp]*(?:\[.*?\])?\{(.*?)\}')
  #                                         pages     key  
  #accumulate the keys of cited works per tex-file
  citations = []
  for tex in texs:
    citations += [c.strip() 
                  for cs in CITE.findall(open(tex).read())  
                    for c in cs.split(',')                 #there might be multiple keys per cite command
                  ]
  citations = list(set(citations)) #uniq
  #store in dict for more efficient checking for presence
  citationsd = dict(zip(citations,[True for t in range(len(citations))]))
  #access bib file
  a = inbib.read().split('\n@') 
  #split preamble (if any) from records
  p = a[0]
  r = a[1:]
  #sort and reverse in order to get the order of edited volumes and incollection right 
  r.sort() 
  r = r[::-1] 
  restrict = False #should only cited works be written to sorted.bib?
  #create the new bibtex records
  bibtexs = [Record(q,
                    inkeysd=citationsd, 
                    restrict=restrict).bibtex() 
              for q in r
            ]
  #assemble output string
  new = '\n\n'.join([b for b in bibtexs if b]) 
  inbib.close()
  #write out
  outbib.write(p)
  outbib.write('\n')
  outbib.write(new)
  outbib.close()
