def to_cypher (string, shift_key)

  new_string = ''
  string_arr = string.split('') # splits the string ino an array with every letter as an element

  string_arr.each do |ascii_val| 

    if ascii_val.ord != 32 # only runs if not space
      new_arr = ascii_val.ord + shift_key
      new_string += new_arr.chr
      #if new_arr > 90
        #puts ((new_arr - 90) + 64).chr
      #end
    else 
      new_string +=  ' '
    end
  end
  puts new_string
end

to_cypher('amazing string', 3);