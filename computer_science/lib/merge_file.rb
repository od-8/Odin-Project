def merge_sort_v2(arr)
  result = []
  return arr if arr.length < 2

  half = arr.length / 2

  left = merge_sort(arr[0..half])
  right = merge_sort(arr[half..])

  until left.empty? || right.empty?
    left[0] <= right[0] ? result << left.shift : result << right.shift
  end

  result + left + right
end

p merge_sort_v2([9, 0, 5, 8, 2, 4, 6, 3, 1, 7])
