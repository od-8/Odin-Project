
class HashMap
  def initialize(capacity = 16, load_factor = 0.75)
    @load_factor = load_factor
    @capacity = capacity
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }  
    hash_code
  end
end

hash = HashMap.new

#hash.set('apple', 'red')
#hash.set('apple', 'green')
#hash.set('apple', 'yellow')