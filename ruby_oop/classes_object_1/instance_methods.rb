class Car
  def initialize (company, engine)
    @engine = engine
    @company = company
  end
  def make
    "My car is a #{@company} and has a #{@engine} engine."
  end
end

supercar = Car.new("Lamborghini Huracane", "g20")
pickup = Car.new("Ford Raptor", "v12") 

puts supercar.make
puts pickup.make