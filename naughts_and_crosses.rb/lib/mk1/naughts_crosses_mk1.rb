puts "Let's play Naughts and crosses"
puts ""
puts "The first player is X"
puts ""
puts "The second player is O"

Squares = [
  ["-", "-", "-"],
  ["-", "-", "-"],
  ["-", "-", "-"]
]
puts ""
Squares.each do |array|
  puts "#{array}\n"
end
puts ""

$num = 1

class Places
  def initialize(row, column, letter)
    @row = row - 1
    @column = column - 1
    @player = letter

    if Squares[@row][@column] != "-"
      puts "Square is full"
      $num -= 1
    else
      Squares[@row][@column] = letter
    end

    Squares.each do |array|
      puts "#{array}\n"
    end

    puts ""
  end
end

#   Horizontal win function

def horizontal_win(squares)
  win_o = ["O", "O", "O"]
  win_x = ["X", "X", "X"]
  if squares.include?(win_o) == true 
    puts "Congrats you won horizontally, great job player O!"
    puts ""
    $win = 1
  end
  if squares.include?(win_x) == true 
    puts "Congrats you won horizontally, great job player X!"
    puts ""
    $win = 1
  end
end

#   Vertical win function

def vertical_win(squares)
  if squares[0][0] == "X" && squares[1][0] == "X" && squares[2][0] == "X"
    puts "Congrats you won vetically, great job player X!"
    puts ""
    $win = 1
  end
  if squares[0][1] == "X" && squares[1][1] == "X" && squares[2][1] == "X"
    puts "Congrats you won vetically, great job player X!"
    puts ""
    $win = 1
  end
  if squares[0][2] == "X" && squares[1][2] == "X" && squares[2][2] == "X"
    puts "Congrats you won vetically, great job player X!"
    puts ""
    $win = 1
  end

  if squares[0][0] == "O" && squares[1][0] == "O" && squares[2][0] == "O"
    puts "Congrats you won vetically, great job player O!"
    puts ""
    $win = 1
  end
  if squares[0][1] == "O" && squares[1][1] == "O" && squares[2][1] == "O"
    puts "Congrats you won vetically, great job player O!"
    puts ""
    $win = 1
  end
  if squares[0][2] == "O" && squares[1][2] == "O" && squares[2][2] == "O"
    puts "Congrats you won vetically, great job player O!"
    puts ""
    $win = 1
  end
end

#   Diagonal win function

def diagonal_win(squares)
  if squares[0][0] == "X" && squares[1][1] == "X" && squares[2][2] == "X"
    puts "Congrats you won diagonally, great job player X!"
    puts ""
    $win = 1
  end
  if squares[0][2] == "X" && squares[1][1] == "X" && squares[2][0] == "X"
    puts "Congrats you won diagonally, great job player X!"
    puts ""
    $win = 1
  end

  if squares[0][0] == "O" && squares[1][1] == "O" && squares[2][2] == "O"
    puts "Congrats you won diagonally, great job player X!"
    puts ""
    $win = 1
  end
  if squares[0][2] == "O" && squares[1][1] == "O" && squares[2][0] == "O"
    puts "Congrats you won diagonally, great job player X!"
    puts ""
    $win = 1
  end
end

#     Board if full function

def board_is_full(num)
  if $num == 10
    puts "The board is full and nobody has won."
    puts ""
    $win = 1
  end
end

$win = 0

while $win == 0 do 
  
  puts "Input row (1 - 3)"
  row = gets.chomp.to_i
  puts ""
  puts "Input column (1 - 3)"
  column = gets.chomp.to_i
  puts ""

  letter = nil
  $num += 1

  if $num % 2 == 0
    letter = "X"
  else
    letter = "O"
  end

  Places.new(row, column, letter)

  horizontal_win(Squares)
  vertical_win(Squares)
  diagonal_win(Squares)
  board_is_full($num)

end