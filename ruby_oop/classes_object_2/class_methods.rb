class Computer
  def initialize(make, model)
    puts "I am a #{make} #{model}."
  end

  def self.what_am_i
    puts "You're a computer class."
  end
end

Computer.new('HP', 'Elitebook')
Computer.what_am_i
