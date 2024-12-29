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


#print_board

class Board
  def initialize(height, length)
    @squares = Array.new(1) { Array.new(height) {Array.new(length)} }
    puts ""
    @squares.each do |array|
      array.each do |array|
        puts "#{array}\n"
      end
    end
    puts ""
  end
end

my_board = Board.new(height, length)

#my_board.print_board
