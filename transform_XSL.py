from lxml import etree


i = '1'
XMLfile = etree.ElementTree().parse('ponctualite-mensuelle-transilien.xml')


XSLfile = etree.ElementTree().parse('question-'+i+'.xsl')
transform = etree.XSLT(XSLfile)

newFile = transform(XMLfile)


with open('question-'+i+'.xml','wb') as f:
    f.write(etree.tostring(newFile, pretty_print=True))
