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
    # p index
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]

    if bucket[0] == key
      bucket[1] = value
    end

    bucket = [key, value]
    @nodes += 1
 
    # Check if size is exceeded
    if @nodes > @capacity * @load_factor
      @capacity *= 2
      @nodes = 0
      current_bucket = @buckets
      @buckets = Array.new(@capacity) { [] }

      current_bucket.each do |pair|
        # @buckets[index] = pair
        pair.each do |key, value|
          set(key, value)
        end
      end
    end
  end
end

hash = HashMap.new

hash.set('apple', 'red')
# hash.set('apple', 'green')
# hash.set('apple', 'yellow')
