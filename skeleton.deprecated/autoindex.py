#!/usr/bin/python3

import glob
import re

lgs=open("locallanguages.txt").read().split('\n')
terms=open("localsubjectterms.txt").read().split('\n')[::-1]#reverse to avoid double indexing
print("found %i language names for autoindexing" % len(lgs))
print("found %i subject terms for autoindexing" % len(terms))

files = glob.glob('chapters/*tex')

SUBJECTP = re.compile
for f in files:
  print("indexing %s" % f)
  c = open(f).read()  
  for lg in lgs:
    lg = lg.strip()
    if lg == '':
      continue
    c = re.sub('(?<!ili{)%s(?![\w}])'%lg, '\ili{%s}'%lg, c)
  for term in terms:
    term = term.strip() 
    if term == '':
       continue
    c = re.sub('(?<!isi{)%s(?![-_\w}])'%term, '\isi{%s}'%term, c)
  nlg = len(re.findall('\\ili{',c))
  nt = len(re.findall('\\isi{',c))
  outfile = open(f.replace('chapters','indexed'), 'w')
  outfile.write(c)
  outfile.close()
  print(" %s now contains %i indexed languages and %i indexed subject terms"%(f.split('/')[-1],nlg,nt))
  
print("indexed files are in the folder 'indexed'")
  
  
  
