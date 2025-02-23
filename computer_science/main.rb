require_relative 'lib/linked_lists.rb'
require_relative 'lib/binary_search_trees.rb'

# list = LinkedList.new

# list.append('dog')
# list.append('cat')
# list.append('parrot')
# list.append('hamster')
# list.append('snake')
# list.append('turtle')

# puts list
# p rand(100.1000)
arr = [13, 43, 56, 78, 91, 23, 43, 81, 55, 66, 77, 42, 36] # Array.new(15) { rand(1..100) }

tree = Tree.new(arr.sort)

tree.level_order { |node| puts "| Node = #{node.data} | Height = #{tree.height(node)} | Depth = #{tree.depth(node)} |" }

puts ''
tree.pretty_print

tree.insert(92)
tree.pretty_print

puts ''

# tree.insert( rand(100..1000) )
# tree.insert( rand(100..1000) )
# tree.insert( rand(100..1000) )
