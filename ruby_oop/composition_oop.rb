class Engine
  def start
    puts "The engine begins to rev..."
  end
end

class Wheels
  def start
    puts "The wheels begin to turn..."
  end
end

class Accelarator
  def start
    puts "The accelarator begins to hiss..."
  end
end

class Car
  def initialize
    @engine = Engine.new
    @wheels = Wheels.new
    @accelarator = Accelarator.new
  end
  def start
    @engine.start
    @wheels.start
    @accelarator.start
  end
end

my_car = Car.new
my_car.start