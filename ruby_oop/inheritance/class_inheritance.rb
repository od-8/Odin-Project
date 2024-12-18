class Car 
  def start
    "Engine is turned on..."
  end

end

class Ferrari < Car
  def start(name)
    "The #{name}'s engine starts..."
  end
end

class RollsRoyce < Car
  attr_accessor :model
  def initialize(m)
    self.model = m
  end

  def start
    "The #{self.model}'s engine revs into life..."
  end
end

class Lamborghini < Car
  
end

gto = Ferrari.new
phantom = RollsRoyce.new("Rolls Royce Phantom")
hurracan = Lamborghini.new

puts gto.start("Ferrari 1985 GTO")
puts phantom.start
puts hurracan.start