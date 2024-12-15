class MyCar 
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(n)
    @speed += n
    puts "Car is accelarating, New speed = #{@speed}mph"
  end

  def brake(n)
    @speed -= n
    puts "Car is deccelarating, New speed = #{@speed}mph"
  end

  def shutdown
    @speed = 0
    puts "Car has shutdown, New speed = #{@speed}"
  end

  def current_speed
    puts " - Car's current speed is #{@speed}"
  end

  def spray_paint=(color)
    puts "Psshhhh, Your car is now the color #{color}"
  end

  attr_accessor :color
  attr_reader :year

  # - 6 lines below can be changed to the 2 above. Work Smater, Not Harder
  
  #def color=(color)
    #@color = color
  #end
  #def year
    #puts "#{@year}"
  #end
  
end

four_wheels = MyCar.new(2006, "Red", "Ford Raptor")

four_wheels.current_speed
four_wheels.speed_up(50)
four_wheels.current_speed
four_wheels.brake(20)
four_wheels.current_speed
four_wheels.shutdown
four_wheels.current_speed

puts ""
puts four_wheels.color = "Yellow"
puts four_wheels.year
puts ""
four_wheels.spray_paint = "Green"