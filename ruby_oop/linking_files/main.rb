require_relative 'lib/functions'

class Car
  def initialize(make, model, year, color)
    @make = make
    @model = model
    @year = year
    @color = color

    puts 'Your Car:'
    puts " - Make = #{@make}"
    puts " - Model = #{@model}"
    puts " - Year = #{@year}"
    puts " - Color = #{@color}"
  end
  include Drivable
  include Breakable
  include Accelerate
  include Deccelerate
  include Driftable
end

puts ''
my_car = Car.new('Ferrari', 'GTO', 1985, 'Red')
puts ''
my_car.drive('V18')
puts ''
my_car.brake
puts ''
my_car.accelerate(30, 70)
puts ''
my_car.deccelerate(70, 30)
puts ''
my_car.drift
puts ''
