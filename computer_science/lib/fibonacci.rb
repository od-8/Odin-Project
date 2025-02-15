# Iterative approach
def fibs(n)
  array = [0, 1]
  if n < 2
    puts "There is only one number at that position: #{array[n]}."
  else
    (n - 2).times do |n|
      array.push(array[n] + array[n + 1])
    end
    puts "Here are the first #{array.length + 1} digits:"
    puts "In order: #{array.join(', ')}"
  end
end

# Recursive aproach
def fibs_rec(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  array = fibs_rec(n - 1)
  array << array[-2] + array[-1]
end
