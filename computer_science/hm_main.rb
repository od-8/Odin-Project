require_relative 'lib/hash_maps.rb'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')


test.set('apple', 'green')
puts test.length
puts ''

test.set('dog', 'yellow')
puts test.length
puts ''

test.set('jacket', 'black')
puts test.length
puts ''

test.info
puts ''

test.set('moon', 'silver')
puts test.length
puts ''

test.info

puts ''

test.set('apple', 'orange')
puts test.length
puts ''

test.set('dog', 'green')
puts test.length
puts ''

test.set('jacket', 'purple')
puts test.length
puts ''

p test.get('jacket')
p test.has?('dog')
p test.has?('cat')
p test.remove('apple')
test.length

puts ''
p test.keys
p test.values
puts ''
p test.entries
puts ''
p test.clear
puts ''