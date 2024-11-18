require 'pry-byebug'

def work (input, key)
  new_str = ''
  new_arr = []
  input_arr = input.split('')
  
  input_arr.each do |num|
    if num.ord != 32
      new_num = num.upcase
      new_arr = ((((new_num.ord + key) + 65) % 26) + 65) 
      new_str += new_arr.chr
    else 
      new_string +=  ' '
    end 
  end

  puts "Your string in ascii is #{new_str.capitalize}"

end

puts ""
puts "Enter message you want encrypted (as a string)"
puts ""

string = gets.chomp

puts ""
puts "Add shift key"
puts ""

shift_key = gets.chomp.to_i

work(string, shift_key)