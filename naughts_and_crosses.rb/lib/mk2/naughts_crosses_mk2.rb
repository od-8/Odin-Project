# frozen_string_literal: false

# Contains all the functions for when the game is over
module GameEnd
  def winner?(letter)
    true if
      @board[0..2].all? { |let| let == letter } ||
      @board[3..5].all? { |let| let == letter } ||
      @board[6..8].all? { |let| let == letter } ||
      @board.values_at(0, 3, 6).all? { |let| let == letter } ||
      @board.values_at(1, 4, 7).all? { |let| let == letter } ||
      @board.values_at(2, 5, 8).all? { |let| let == letter } ||
      @board.values_at(0, 4, 8).all? { |let| let == letter } ||
      @board.values_at(2, 4, 6).all? { |let| let == letter }
  end

  def full?
    true if @board.all? { |num| !num.is_a?(Integer) }
  end
end

# Contains the main board and functionality
class Game
  def initialize
    @board = Array.new(9) { |n| n + 1 }
  end

  def move(position, letter)
    @board[position - 1] = letter
  end

  def print_board
    puts "\n
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    --+---+--
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    --+---+--
    #{@board[6]} | #{@board[7]} | #{@board[8]}
    \n"
  end

  # Check's if the move is playable
  def legal_move?(position)
    true if position.between?(1, 9) && position.is_a?(Integer) && @board[position - 1].is_a?(Integer)
  end

  # Module for when the game ends, includes winning and full functions
  include GameEnd
end

my_board = Game.new

puts "Let's play Naughts and crosses"
puts ''
puts 'This is the board you will be playing on.'
sleep 1
my_board.print_board
sleep 3
puts 'Choose the number of the square where you would like to put your letter.'
sleep 2
puts ''
puts 'Player 1 will be X and player 2 to will be O'
puts ''

$win = 0
num = 1

until $win == 1
  num += 1
  letter = if num.even?
             'X'
           else
             'O'
           end

  puts "Player #{letter}, where would you like to play (1 - 9)"
  position = gets.chomp.to_i
  puts ''

  until my_board.legal_move?(position) == true
    puts 'That is an invalid move, please try again.'
    puts "Player #{letter}, where would you like to play (1-9)"
    position = gets.chomp.to_i
    puts ''
  end

  my_board.move(position, letter)
  my_board.print_board

  if my_board.winner?(letter)
    puts "Congratulations player #{letter} you have won!"
    $win = 1
  end

  if my_board.full?
    puts "It's a draw, no one has won."
    $win = 1
  end
end
