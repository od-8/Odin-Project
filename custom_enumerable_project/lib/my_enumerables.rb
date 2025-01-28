module Enumerable
  def my_each_with_index
    count = 0
    self.my_each do |item|
      yield item, count
      count += 1
    end
  end

  def my_select
    select_result = Array.new
    self.my_each do |item|
      select_result << item if yield item
    end
    select_result
  end

  def my_all?
    self.my_each do |item|
      return false unless yield item
    end
    true 
  end

  def my_any?
    self.my_each do |item|
      return true if yield item
    end
    false
  end

  def my_none?
    self.my_each do |item|
      return false if yield item
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |item|
      if block_given?
        count += 1 if yield item
      else
        count = self.length
      end
    end
    count
  end

  def my_map
    map_array = []
    self.my_each do |item|
      item = yield item
      map_array << item
    end
    map_array
  end

  def my_inject(initial = nil)
    item = initial.nil? ? self[0] : initial

    self.my_each do |element|
      item = yield(item, element)
  end
  item
  end
end

class Array
  def my_each
    for item in self
      yield item
    end
  end
end

