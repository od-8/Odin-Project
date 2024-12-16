class Car
  attr_accessor :make
  def initialize (company, engine)
    @engine = engine
    @company = company
  end

  def details
    "My car is a #{make} and has a #{@engine} engine."
  end

  #def make=(make)
    #@company = make
  #end
end

supercar = Car.new("Lamborghini Huracane", "g20")
pickup = Car.new("Ford Raptor", "v12") 


supercar.make = "McLaren"
puts supercar.details

puts ""

pickup.make = "Land Rover"
puts pickup.details