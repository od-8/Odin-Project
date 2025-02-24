class HashMap
  def initialize(capacity = 16, load_factor = 0.75)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity) { [] }
    @nodes = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    # Check if the key already exists
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    bucket << [key, value]
    @nodes += 1

    # When load factor is greater than the amount of nodes recreate the hash table with double the capacity
    if (@capacity * @load_factor) < @nodes
      prev_buckets = @buckets
      @capacity *= 2
      @buckets = Array.new(@capacity) { [] }
      @nodes = 0

      prev_buckets.each do |pair|
        pair.each do |key, value|
          set(key, value)
        end
      end
    end
  end

  def get(key)
    @buckets.each do |sub_array|
      sub_array.each do |pair|
        if pair[0] == key
          return pair[1]
        end
      end
    end
    nil
  end

  def has?(key)
    @buckets.each do |sub_array|
      sub_array.each do |pair|
        if pair[0] == key
          return true
        end
      end
    end
    false
  end

  def remove(key)
    #p @buckets
    @buckets.each_with_index do |sub_array, index|
      p sub_array
      p index
      puts ''
      #sub_array.each do |pair|
      #end
    end
  end

  def info
    p @buckets
    #@buckets.each { |pair| p pair }
  end
end

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')

#test.info
puts ''

test.remove('dog')

#test.info