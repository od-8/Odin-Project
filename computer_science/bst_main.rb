require_relative 'lib/binary_search_trees.rb'

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9] # Array.new(15) { rand(1..100) }

tree = Tree.new(arr.sort)

# tree.level_order { |node| puts "| Node = #{node.data} | Height = #{tree.height(node)} | Depth = #{tree.depth(node)} |" }

# tree.postorder { |node| puts node.data }
# tree.inorder { |node| puts node.data }
# tree.preorder { |node| puts node.data }

puts ''
tree.pretty_print
puts ''

# tree.insert(90)

# tree.pretty_print
puts ''

# preorder = correct
# inorder = wrong
# postorder = wrong