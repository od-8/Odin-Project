require_relative 'lib/linked_lists.rb'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

list.pop
#list.pop
#list.pop
#list.pop
#list.pop

puts list
list.tail