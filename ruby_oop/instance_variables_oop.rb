class Human
  def initialize(person)
    @human = person
    puts "Name = #{@human}"
  end
end

Human.new("Jim")
Human.new("Sam")