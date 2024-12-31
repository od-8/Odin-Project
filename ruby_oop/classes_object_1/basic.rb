puts 'Input dog name'

module Speak
  def sound(noise)
    dog_name = gets.chomp
    puts "Your dog's name is #{dog_name.capitalize} and his noise is '#{noise}' "
  end
end

class DogName
  include Speak
end

dog_name = DogName.new

dog_name.sound('woof!')
