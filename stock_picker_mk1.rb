require 'pry-byebug'

def pick_stocks (arr)
  new_arr = []
  val = 0
  arr.each_with_index do |element, index|
    new_arr.push(element) if index > 2
    new_arr.each do |element|
      puts element
      #binding.pry
      #min_index = element.index[element.min]
      #max_index = element.index(element.max)
      #min_val = element.min
      #max_val = element.max
    end
  end
  #puts "Buy = #{min_index}, Sell = #{max_index}, Profit = #{max_val - min_val}"
end

pick_stocks([7, 3, 11, 1, 4, 8, 6])