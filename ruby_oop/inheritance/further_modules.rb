class AreaOfCircle
  def self.find_area(diameter)
    x = diameter / 2
    puts "Area of a circle with a radius of '#{x}' is '#{Math::PI * (x * x)}'"
  end
end

class CircumferenceOfCircle
  def self.find_circumference(diameter)
    puts "Circumference of a circle with a diameter of '#{diameter}' is '#{Math::PI * diameter}'"
  end
end

AreaOfCircle.find_area(20)
CircumferenceOfCircle.find_circumference(10)

module Car
  class Ferrari
    def start(engine)
      puts "The #{engine} engine revs to life"
    end
  end

  class Mclaren
    def model(model)
      puts "This is a Mclaren #{model}"
    end
  end

  class Lamborghini
    def year(year)
      puts "The Lamborghini was made in #{year}"
    end
  end

  class RollsRoyce
    def self.speed(time, distance)
      puts "The average speed is #{distance / time} mph"
    end
  end
end

gto = Car::Ferrari.new
f1 = Car::Mclaren.new
hurracan = Car::Lamborghini.new
# phantom = Car::Lamborghini.new

puts ''
gto.start('V12')
f1.model('F1')
hurracan.year(2020)
Car::RollsRoyce.speed(2, 10)
