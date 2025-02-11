class Node
  attr_accessor :data, :left_child, :right_child
  def initialize(data = nil, prev_node = nil)
    #@prev_node = nil
    @data = data
    @left_child = nil
    @right_child = nil
  end
end

class Tree
  attr_accessor :root, :array

  def initialize(array)
    @root = build_tree(array)
  end

  # Creates the tree
  def build_tree(array, node)
    return nil if array.empty?

    array = array.sort.uniq
    middle = array.length / 2

    root = Node.new(array[middle], )

    root.left_child = build_tree(array[0...middle,])
    root.right_child = build_tree(array[middle+1...], root)

    return root
  end

  # Makes the tree easy to visualize (provided from lesson)
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  # Creates a new node at end of branch
  def insert(value, root = @root)
    if root.left_child.nil? && root.right_child.nil? 
      root.left_child = Node.new(value) if value < root.data
      root.right_child = Node.new(value) if value > root.data
    elsif value < root.data
      insert(value, root.left_child)
    elsif value > root.data
      insert(value, root.right_child)
    end
  end


  # Will do delete later, stuff doing it now
  def delete(value, root = @root)

  end
  
  # Find the node of the provided value, returns nil if no matches
  def find(value, root = @root)
    if root&.data.nil?
      puts "There are no nodes that have the value of: #{value}."
    elsif root.data == value
      puts root
    elsif value < root.data
      find(value, root.left_child)
    elsif value > root.data
      find(value, root.right_child)
    end
  end

  def level_order()
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.pretty_print

puts ''

tree.pretty_print