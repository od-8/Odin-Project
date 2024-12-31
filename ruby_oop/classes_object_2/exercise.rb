class MyCar
  def self.miles_per_gallon(g, m)
    puts "Miles per Gallon = #{m / g}"
  end

  def to_s
    'This is a friendlier version of to_s'
  end
end

my_car = MyCar.new
puts my_car

MyCar.miles_per_gallon(13, 351)
