module Drivable
  def drive
    puts 'You stat the egine and the car roars to life...'
  end
end

module Driftable
  def drift
    puts 'You car skids at an angle leaving black tyre marks across the road...'
  end
end

class Vehicle
  attr_accessor :make, :color, :year

  def initialize(make, color, year)
    self.make = make
    self.color = color
    self.year = year
    @@num_of_objects += 1
  end

  def start_engine
    puts 'You turn the the keys and the engine revs to life...'
  end

  def self.object_count
    "There are currently #{@@num_of_objects} objects that inherit from the Vehicle class."
  end

  def age
    puts "Your #{make} is #{year_old} years old."
  end

  @@num_of_objects = 0
  include Drivable

  private

  def year_old
    Time.now.year - year
  end
end

class MyCar < Vehicle
  attr_accessor :top_speed, :electric

  def initialize(make, color, year, top_speed, electric)
    super(make, color, year)
    self.top_speed = top_speed
    self.electric = electric
  end
  NUM_OF_DOORS = 4
  include Driftable
end

class MyTruck < Vehicle
  attr_accessor :num_of_wheels, :cargo

  def initialize(make, color, year, num_of_wheels, cargo)
    super(make, color, year)
    self.num_of_wheels = num_of_wheels
    self.cargo = cargo
  end
  NUM_OF_DOORS = 2
end

my_car = MyCar.new('Ferrari', 'Red', 2020, 130, false)
my_truck = MyTruck.new('Volkswagen', 'Black', 2018, 6, 'Food')

my_car.drive
my_truck.drive

puts ''

my_car.start_engine
my_truck.start_engine

puts ''

my_car.drift

puts ''
puts Vehicle.object_count
puts ''
puts MyCar.ancestors
puts ''
puts MyTruck.ancestors
puts ''

my_car.age
my_truck.age

#
# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end
#
#   def better_grade_than?(student2)
#     grade > student2.grade
#   end
#
#   attr_reader :grade
# end
#
# joe = Student.new("Joe", 90)
# bob = Student.new("Bob", 94)
#
# puts "Well done!" if joe.better_grade_than?(bob)
# puts "What a shame..." if bob.better_grade_than?(joe)
#
