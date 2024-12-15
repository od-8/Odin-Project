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
    puts "Car is deccelarating, New spped = #{@speed}mph"
  end

  def shutdown
    @speed = 0
    puts "Car has shutdown, New speed = #{@speed}"
  end

  def current_speed
    puts "Car's current speed is #{@speed}"
  end
end

four_wheels = MyCar.new(2006, "Red", "Ford Raptor")

four_wheels.current_speed
four_wheels.speed_up(50)
four_wheels.current_speed
four_wheels.brake(20)
four_wheels.current_speed
four_wheels.shutdown
four_wheels.current_speed