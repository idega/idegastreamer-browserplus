require 'rexml/document'
include REXML
file = File.new("bibliography.xml")
doc = Document.new(file)
puts doc
root = doc.root
root.attributes['id']
puts root.elements[1].elements["author"]
puts root.elements["biblioentry[1]/author"]

root.each_element('//author') {|author| puts author}

root.add_element("testentry")
testentry = root.elements["testentry"]
author = Element.new("author")
author.add_element("firstname")
author.elements["firstname"].text = "Eiki"
testentry.elements << author

#doc2.root.insert_before("//pubdate", publisher)
#publishername.add_text("Oxford University Press")
#doc2.root.insert_before("//pubdate", publisher)
#doc2.delete_element("//publisher")
#doc2.root.delete_attribute('id')
puts doc

puts root.text