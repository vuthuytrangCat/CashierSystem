require "yaml"
class Readfile
   #print 'Enter File name: '
#fname = STDIN.gets.chomp()  # or fname = gets.chomp()
#fname_read = File.open("../assets/rules.yml")
fname_read = File.open("../assets/products.yml")

#puts fname_read.read()
text = YAML.load(fname_read.read())
puts text['Green Tea']['unit_price']
end