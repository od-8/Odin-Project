class Car
  @@horsepower = 120
  @@max_speed = 100
  def initialize
    @@horsepower += 10
    @@max_speed += 20
  end

  def self.power
    puts ""
    puts "Horsepower = #{@@horsepower} hp"
    puts "Speed = #{@@max_speed} mph"
    puts ""
  end
end

Car.power
Car.new
Car.power
Car.new
Car.power
Car.new
Car.power
Car.new
Car.power