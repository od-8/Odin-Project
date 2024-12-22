module Driftable
  def drift
    puts "You car turns to the side and you skid round at an angle..."
  end
end

module Drivable
  def drive 
    puts "The engine revs to life and you speed off into the distance..."
  end
end

module Topspeed
  def fast_as_possible
    puts "Your car is now going as fast as possible, New Top Speed = 200mph"
  end
end

class Car
  include Drivable # Works for all objects
end

class Sportscar < Car
  include Driftable # Works for all Sportscar objects and objects of Sportscar subclasses
end

class Ferrari < Sportscar
end

class Mclaren < Sportscar
end

class Racecar < Car
  include Topspeed # Works for only Racecar objects
end  

gto = Ferrari.new
f1 = Racecar.new

puts "GTO:"
gto.drive
gto.drift

puts ""
puts "F1:"

f1.drive
#f1.drift  # Wont work as only Sportscar objects and Sportscar subclasses objects have access to this

puts ""
puts "Top Speed:"

#gto.fast_as_possible   # Wont work as fast_as_possible only works for Racecar objects 
f1.fast_as_possible