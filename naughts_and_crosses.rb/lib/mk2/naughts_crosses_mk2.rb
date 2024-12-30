puts "Let's play Naughts and crosses"
puts ""
puts "Input the first's player's name."
player_1 = gets.chomp
puts ""
puts "Hello #{player_1}, you will be playing as X."
puts ""
puts "Input second player's name."
player_2 = gets.chomp
puts ""
puts "Hello #{player_2}, you will be playing as O."
puts ""
puts "Input what size you'd like the board eg 3x3"
puts "Input height"
height = gets.chomp.to_i
puts ""
puts "Input length"
length = gets.chomp.to_i

module Victory
  def horizontal_win(board, length)
    winning_x = []
    winning_o = []
    length.each do
      winning_x.push("X")
      winning_o.push("O")
    end
    if board.include?(winning_o) == true || board.include?(winning_x) == true
      puts "Somebody has won horizontally."
    end
  end
end
class Board
  def initialize(height, length)
    @squares = Array.new(1) { Array.new(height) {Array.new(length)} }
  end
  include Victory
  
  def print_board
    puts ""
    @squares.each do |array|
      array.each do |array|
        puts "#{array}\n"
      end
    end
    puts ""
  end
end

class Places
  def initialize(row, column, letter)
    @row = row - 1
    @column = column - 1
    @player = letter

    if my_board[@row][@column] != nil
      puts "Square is full"
      $num -= 1
    else
      my_board[@row][@column] = letter
    end

    Squares.each do |array|
      puts "#{array}\n"
    end

    puts ""
  end
end

while true 
  puts "Input row (1 - 3)"
  row = gets.chomp.to_i
  puts ""
  puts "Input column (1 - 3)"
  column = gets.chomp.to_i
  puts ""
  puts "Input letter (X or O)"
  letter = gets.chomp
  puts ""

  my_board = Board.new(height, length)

  my_board.horizontal_win(my_board, length)

  my_board.print_board

  Places.new(row, column, letter)
end