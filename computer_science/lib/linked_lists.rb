class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
    @num = @size
  end

  # Adds item to end of list
  def append(item)
    new_node = Node.new(item, nil, @tail)
    if @head.nil?
      @tail = new_node
      @head = new_node
    else
      @previous_node = @tail
      @tail.next_node = new_node
      @tail = new_node  
    end
    @size += 1
  end

  # Adds item to start of list
  def prepend(item)
    new_node = Node.new(item, @head)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @head = new_node
    end
    @size += 1
  end

  # First node in list
  def head
    puts @head.value
  end

  # Last node in list
  def tail
    puts @tail.value
  end

  # Size of list
  def size
    puts @size
  end

  # At_index method
  def at_index(target_index, node = @head, current_index = 1)
    if current_index == target_index
      node&.value.nil? ? 'none found' : node.value
    else
      at_index(target_index, node.next_node, current_index += 1)
    end
  end

  # Remove last node in list
  def pop
    @tail = @tail.previous_node
    @tail.next_node = nil
  end

  # Checks if list contains node
  def contains?(value, node = @head)
    if node&.value.nil? 
      false
    elsif value == node.value
      true
    else
      contains?(value, node.next_node)
    end
  end

  # Gets index of node in list
  def find(value, node = @head, counter = 1)
    if node&.value.nil?
      puts 'nil '
    elsif value == node.value
      counter
    else
      find(value, node.next_node, counter += 1)
    end
  end

  # Print the nodes so they are easy to understand
  def to_s()
    nodes = []
    node = @head
    until node&.value.nil?
      nodes << "( #{node.value} )"
      node = node.next_node
    end
    nodes.join(" -> ") + " -> nil"
  end
end


class Node
  attr_accessor :value, :next_node, :previous_node
  def initialize(val, node, prev_node = nil)
    @value = val
    @next_node = node
    @previous_node = prev_node
  end
end
