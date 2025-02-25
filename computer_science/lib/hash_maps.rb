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
=begin
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
    @buckets.each_with_index do |bucket, index|
      bucket.each_with_index do |pair, sub_index|
        if pair[0] == key
          @buckets.delete_at([index][sub_index])
          @nodes -= 1
          return pair[1]
        end
      end
    end
    nil
  end
=end

  def get(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index].each { |pair| return pair[1] if pair[0] == key}
    nil
  end

  def has?(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index].each { |pair| return true if pair[0] == key}
    false
  end

  def remove(key)
    index = hash(key) % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    @buckets[index].each_with_index do |pair, i|
      if pair[0] == key
        @buckets.delete(@buckets[index][i])
        return pair[1]
      end
    end
    nil
  end

  def length(length = 0)
    @buckets.each do |sub_array|
      sub_array.each do |pair|
        if pair[0] != nil
          length += 1
        end
      end
    end
    return length
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @nodes = 0
  end

  def keys(keys = [])
    @buckets.each do |bucket|
      bucket.each do |pair|
        keys << pair[0]
      end
    end
    return keys
  end

  def values(values = [])
    @buckets.each do |bucket|
      bucket.each do |pair|
        values << pair[1]
      end
    end
    return values
  end

  def entries(pairs = [])
    @buckets.each do |bucket|
      bucket.each do |pair|
        pairs << pair unless pair.empty?
      end
    end
    return pairs
  end

  def info
    @buckets.each { |bucket|  p bucket}
  end
end
