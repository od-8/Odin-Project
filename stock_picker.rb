def stock_picker (arr, arr_size)
  if arr_size > 1 
    max_diff = arr[1] - arr[0]
    min_element = arr[0]
    arr_index = 1
    min_index = 0
    for i in 0...arr.length
      if arr[i] - min_element > max_diff
        max_diff = arr[i] - min_element
        arr_index = arr.find_index(arr[i])
        min_index = arr.find_index(min_element)
      end
      if arr[i] < min_element
        min_element = arr[i]
      end 
    end
    puts "Buy day #{min_index} and Sell day #{arr_index}. Profit = #{max_diff}"
  else
    puts "Array has to have at least than 2 items"
  end
end

arr = [4, 11, 1, 9, 5, 2]
arr_size = arr.length

puts ""
stock_picker(arr, arr_size) 
puts ""