def sort_array(arr)
  arr_size = arr.size - 1
  if arr.size > 1
    arr_size.times do
      arr.each_with_index do |_value, i|
        if i < arr.size - 1 && arr[i] > arr[i + 1]
          arr[i], arr[i + 1] = arr[i + 1], arr[i] # Swaps the places of the element[i] and the 1 to the right of it [i + 1]
        end
      end
    end
    puts "#{arr}"
  else
    puts 'Array needs at least 2 items'
  end
end

array = [12, 13, 1, 19, 11, 14, 7]

puts ''
sort_array(array)
puts ''
