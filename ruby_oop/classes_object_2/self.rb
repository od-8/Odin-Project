class Car
  attr_accessor :horsepower, :engine, :make

  def initialize(horsepower, engine, make)
    @horsepower = horsepower
    @engine = engine
    @make = make
  end

  def self.speed(time, distance)
    puts "Curent speed = #{distance / time}."
  end

  def self.velocity(velocity_f, velocity_i, time)
    puts "Average velocity = #{(velocity_f - velocity_i) / time}."
  end

  def weight(mass, g)
    puts "Weight = #{mass * g}"
  end

  def upgrade(horsepower, engine, make)
    self.horsepower = horsepower
    self.engine = engine
    self.make = make
  end

  def details
    puts "Info = #{@horsepower}, #{@engine}, #{@make}"
  end
end

Car.speed(5, 60)
Car.velocity(80, 40, 2)

puts ''

my_car = Car.new(100, 'v12', 'Ferrari')
my_car.weight(800, 10)
puts my_car.engine
puts ''
my_car.details
my_car.upgrade(120, 'v20', 'McLaren')
my_car.horsepower = 140
my_car.details
puts ''

class Computer
  attr_accessor :cpu, :storage

  def initialize(cpu, storage)
    self.cpu = cpu
    self.storage = storage
  end

  def what_is_self
    p self
  end

  def self.a_method
    puts 'Self method works!'
  end

  def to_s
    'This is a custom to_s method, if this wasnt made it would return similar result to the what_is_self method'
  end
  puts self
end

elitebook = Computer.new('Intel I9', 512)
Computer.a_method
puts elitebook
puts ''
elitebook.what_is_self
