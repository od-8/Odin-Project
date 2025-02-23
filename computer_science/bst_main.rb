require_relative 'lib/binary_search_trees.rb'

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.balanced?

puts ''
tree.level_order { |node| puts node.data }
puts ''
tree.preorder { |node| puts node.data }
puts ''
tree.postorder { |node| puts node.data }
puts ''
tree.inorder { |node| puts node.data }
puts ''

tree.insert(rand(100..999))
tree.insert(rand(100..999))
tree.insert(rand(100..999))
tree.insert(rand(100..999))
tree.insert(rand(100..999))
tree.insert(rand(100..999))


tree.balanced?
puts ''
tree.rebalance
puts ''
tree.balanced?

puts ''
tree.level_order { |node| puts node.data }
puts ''
tree.preorder { |node| puts node.data }
puts ''
tree.postorder { |node| puts node.data }
puts ''
tree.inorder { |node| puts node.data }
puts ''
