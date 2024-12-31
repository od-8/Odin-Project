class Car
  attr_accessor :make, :color, :model, :year

  def initialize(make, color, model, year)
    @make = make
    @year = year
    @color = color
    @model = model
  end
end

class Ferrari < Car
  def initialize(make, color, model, year)
    super(make, color, model, year)
  end
end

my_car = Ferrari.new('Ferrari', 'Red', '288 GTO', 1985)

puts " - Make = '#{my_car.make}'"
puts " - Color = '#{my_car.color}'"
puts " - Model = '#{my_car.model}'"
puts " - Year = '#{my_car.year}'"
