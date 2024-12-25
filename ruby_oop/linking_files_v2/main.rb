require_relative 'lib/files'

class Cars
  attr_accessor :make, :model, :year
  def initialize(make, model, year)
    self.make = make
    self.model = model
    self.year = year
  end
  include Driftable
end

my_car = Cars.new("Ferrari", "288 GTO", 1985)
my_car.make
my_car.model
my_car.year
my_car.drift