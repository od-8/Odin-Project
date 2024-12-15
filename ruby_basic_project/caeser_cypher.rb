def to_ascii(input, key)
  new_str = ""
  input_arr = input.split('')
  input_arr.each do |num|  
    if num.ord != 32 && num.ord > 64 && num.ord < 91  # Checks if the number is upercase in ascii values
      num = ((((num.ord + key) + 65) % 26) + 65)
      new_str += num.chr
    end
    if num.ord != 32 && num.ord > 96 && num.ord < 123  # Check if the number is lowercase in ascii values
      num = (((num.ord - 97 + key) % 26) + 97)
      new_str += num.chr
    end
    if num.ord == 32  # Adds a space cause 32 in ascii is space
      new_str += " "
    end 
  end
  puts "Your string '#{input}' in ascii is '#{new_str}'"
end

puts ""
puts "Enter message you want encrypted (as a string)"
puts ""

string = gets.chomp

puts ""
puts "Add shift key"
puts ""

shift_key = gets.chomp.to_i

puts ""
to_ascii(string, shift_key)
puts ""