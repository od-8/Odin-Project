# frozen_string_literal: false

# Each node in the bst
class Node
  attr_accessor :data, :left_child, :right_child

  def initialize(data = nil)
    @data = data
    @left_child = nil
    @right_child = nil
  end
end

# The bst itself
class Tree
  attr_accessor :root, :array

  def initialize(array)
    @root = build_tree(array)
  end

  # Creates the tree
  def build_tree(array)
    return nil if array.empty?

    array = array.sort.uniq
    middle = array.length / 2

    root = Node.new(array[middle])

    root.left_child = build_tree(array[0...middle])
    root.right_child = build_tree(array[middle + 1...])

    root
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

  # Will do delete later, cant be bothered rn
  # def delete(value, root = @root); end

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

  # Goes through tree in breadth-first level order
  def level_order(queue = [], array = [], &block)
    queue << @root
    puts 'Root'
    yield @root

    # Checks if all the items have no children, the array.length makes it so it only ends when the array has elements with no children
    # If the array.length was not included it would end the moment array = [] which is the first iteration
    until array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !array.empty?
      array = []

      queue.each do |item|
        array << item.left_child unless item.left_child.nil?
        array << item.right_child unless item.right_child.nil?
      end

      queue = array
      array.each(&block)
    end
  end

  # Goes through tree in depth-first preorder
  def preorder(left_array = [], right_array = [], &block)
    full_left_array = []
    full_right_array = []
    left_queue = []
    right_queue = []

    left_queue << @root.left_child
    right_queue << @root.right_child

    # Handle left subtree
    until left_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !left_array.empty?
      left_array = []

      left_queue.each do |item|
        left_array << item.left_child unless item.left_child.nil?
        left_array << item.right_child unless item.right_child.nil?
      end

      left_queue = left_array
      left_queue.each { |node| full_left_array << node }
    end

    # Handle right subtree
    until right_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !right_array.empty?
      right_array = []

      right_queue.each do |item|
        right_array << item.left_child unless item.left_child.nil?
        right_array << item.right_child unless item.right_child.nil?
      end

      right_queue = right_array
      right_array.each { |node| full_right_array << node }
    end

    puts 'Root'
    yield @root
    puts ''
    puts 'Left subtree'
    yield @root.left_child
    full_left_array.each(&block)
    puts ''
    puts 'Right subtree'
    yield @root.right_child
    full_right_array.each(&block)
  end

  # Goes through tree in depth-first postorder
  def postorder(left_array = [], right_array = [], &block)
    full_left_array = []
    full_right_array = []
    left_queue = []
    right_queue = []

    left_queue << @root.left_child
    right_queue << @root.right_child

    # Handle left subtree
    until left_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !left_array.empty?
      left_array = []

      left_queue.each do |item|
        left_array << item.left_child unless item.left_child.nil?
        left_array << item.right_child unless item.right_child.nil?
      end

      left_queue = left_array
      left_queue.each { |node| full_left_array << node }
    end

    # Handle right subtree
    until right_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !right_array.empty?
      right_array = []

      right_queue.each do |item|
        right_array << item.left_child unless item.left_child.nil?
        right_array << item.right_child unless item.right_child.nil?
      end

      right_queue = right_array
      right_array.each { |node| full_right_array << node }
    end

    puts 'Left subtree'
    yield @root.left_child
    full_left_array.each(&block)
    puts ''
    puts 'Right subtree'
    yield @root.right_child
    full_right_array.each(&block)
    puts ''
    puts 'Root'
    yield @root
  end

  # Goes through tree in depth-first inorder
  def inorder(left_array = [], right_array = [], &block)
    full_left_array = []
    full_right_array = []
    left_queue = []
    right_queue = []
    left_queue << @root.left_child
    right_queue << @root.right_child

    # Handle left subtree
    until left_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !left_array.empty?
      left_array = []

      left_queue.each do |item|
        left_array << item.left_child unless item.left_child.nil?
        left_array << item.right_child unless item.right_child.nil?
      end

      left_queue = left_array
      left_queue.each { |node| full_left_array << node }
    end

    # Handle right subtree
    until right_array.all? { |item| item.left_child.nil? && item.right_child.nil? && !item.nil? } && !right_array.empty?
      right_array = []

      right_queue.each do |item|
        right_array << item.left_child unless item.left_child.nil?
        right_array << item.right_child unless item.right_child.nil?
      end

      right_queue = right_array
      right_array.each { |node| full_right_array << node }
    end

    puts 'Left subtree'
    yield @root.left_child
    full_left_array.each(&block)
    puts ''
    puts 'Root'
    yield @root
    puts ''
    puts 'Right subtree'
    yield @root.right_child
    full_right_array.each(&block)
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 234])
# tree.level_order { |node| put node.data }
# tree.preorder { |node| puts node.data }
# tree.postorder { |node| puts node.data }
# tree.inorder { |node| puts node.data }
puts ''
tree.pretty_print
