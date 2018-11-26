import sys  
try:
    from indextools import processfile
except ImportError:
    from langsci.indextools import processfile

if __name__ == '__main__':
    """
    Transform a file main._dx into mainmod._dx, where the underscore represents an index type given in the argument.

    Index types are:
    a: author index 
    s: subject index 
    l: language index

    Examples: 
    > python3 fixindex.py 
    fixes the author index only. Read: main.adx. Write: mainmod.adx
    > python3 fixindex.py a
    fixes the author index only. Read: main.adx. Write: mainmod.adx
    > python3 fixindex.py l
    fixes the language index only. Read: main.ldx. Write: mainmod.ldx
    > python3 fixindex.py lsa
    fixes all three index types. Read: main.adx, main.ldx, main.sdx. Write: mainmod.adx, mainmod.ldx, mainmod.sdx
    """
    
    indextypes = 'a'  
    try:
        indextypes = sys.argv[1]
    except IndexError:
        pass
    for indextype in indextypes:
        processfile("main.%sdx" % indextype)
    
  