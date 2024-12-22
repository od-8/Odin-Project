class Car
  attr_accessor :make, :model, :year, :max_speed
  
  def initialize (make, model, year)
    self.make = make
    self.model = model
    self.year = year
    self.max_speed = 130
  end

  def info 
    puts "Original Info:"
    puts " - Make = #{make}"
    puts " - Model = #{model}"
    puts " - Year = #{year}"
    puts " - Previous Max Speed = #{max_speed}"
  end

  def new_info
    puts "New Info:"
    puts " - Make = #{make}"
    puts " - Model = #{model}"
    puts " - Year = #{year}"
    puts " - Previous Max Speed = #{max_speed}"
    puts " - New Max Speed = #{unlocked_speed}"
  end

  private

  def unlocked_speed
    max_speed + 50
  end

end

my_car = Car.new("Ferrari", "GTO 288", 1985)

#my_car.unlocked_speed # Wont work as private methods are only accesible from other methods in the same class, thats why new_info works

puts ""
my_car.info
puts ""
my_car.new_info
puts ""