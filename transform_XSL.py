from lxml import etree

XMLfile = etree.ElementTree().parse('ponctualite-mensuelle-transilien.xml')


XSLfile = etree.ElementTree().parse('question-1.xsl')
transform = etree.XSLT(XSLfile)

newFile = transform(XMLfile)


with open('question-1.xml','wb') as f:
    f.write(etree.tostring(newFile, pretty_print=True))