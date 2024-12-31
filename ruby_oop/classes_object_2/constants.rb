# Example 1

class Car
  HORSEPOWER = 80
  attr_accessor :time, :distance, :speed

  def initialize(t, d)
    self.time = t
    self.distance = d
    self.speed = d / t
  end
end

my_car = Car.new(2, 10)
puts ''
puts my_car.time
puts my_car.distance
puts my_car.speed
puts ''

# Example 2

class GoodDog
  DOG_YEARS = 7
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
end

sparky = GoodDog.new('Sparky', 2)
puts ''
puts sparky.age
puts sparky.name
sparky.name = 'Jerry'
sparky.age = 7
puts sparky.name
puts sparky.age
puts ''
