# frozen_string_literal: false

# The board class
class Board
  def initialize(first, second, third, fourth)
    @board = Array.new(5) { Array.new(4) { |_n| '-' } }
    @winning_combo = Array.new(3)
    @winning_combo[0] = first
    @winning_combo[1] = second
    @winning_combo[2] = third
    @winning_combo[3] = fourth
  end

  def print_board
    puts '+---+---+---+---+'
    puts "| #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} |"
    puts '+---+---+---+---+'
    puts "| #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} |"
    puts '+---+---+---+---+'
    puts "| #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} |"
    puts '+---+---+---+---+'
    puts "| #{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} |"
    puts '+---+---+---+---+'
    puts "| #{@board[4][0]} | #{@board[4][1]} | #{@board[4][2]} | #{@board[4][3]} |"
    puts '+---+---+---+---+'
    puts ''
    puts "Winning combo = #{@winning_combo}"
  end

  $i = -1
  $n = -1
  $x = 0
  $z = 0

  def add_colors(one, two, three, four)
    $i += 1
    @board[$i][0] = one
    @board[$i][1] = two
    @board[$i][2] = three
    @board[$i][3] = four
  end

  def right_place?
    $n += 1
    true if
    @board[$n].any? { |i| i == @winning_combo[0] } ||
    @board[$n].any? { |i| i == @winning_combo[1] } ||
    @board[$n].any? { |i| i == @winning_combo[2] } ||
    @board[$n].any? { |i| i == @winning_combo[3] }
  end

  def win?
    true if @board[0] == @winning_combo
  end

  def full?
    true if $z == 5 
  end
end

# puts 'Lets play mastermind'
# puts ''
# puts 'Player 1 will be guessing.'
# puts ''
# puts 'player 2 will input the 4 correct colors.'
# puts ''
puts 'Input the first color'
color_1 = gets.chomp.downcase
puts ''
puts 'Input the second color'
color_2 = gets.chomp.downcase
puts ''
puts 'Input the third color'
color_3 = gets.chomp.downcase
puts ''
puts 'Input the fourth color'
color_4 = gets.chomp.downcase
puts ''
my_board = Board.new(color_1, color_2, color_3, color_4)
my_board.print_board

until $x == 1 do
  puts 'Input your first guess'
  guess_1 = gets.chomp.downcase
  puts ''
  puts 'Input your second guess'
  guess_2 = gets.chomp.downcase
  puts ''
  puts 'Input your thrid guess'
  guess_3 = gets.chomp.downcase
  puts ''
  puts 'Input your fourth guess'
  guess_4 = gets.chomp.downcase
  puts ''
  # puts 'Processing...'
  # puts ''
  # sleep 1
  my_board.add_colors(guess_1, guess_2, guess_3, guess_4)
  my_board.print_board

  puts '  A letter is correct' if my_board.right_place?
  if my_board.win?
    puts "  Sorry player 1 you're you colors were to easy to guess, congrats player 2!"
    $x = 1
  end

  if my_board.full?
    $x = 1
    puts '  Sorry player 2 you ran out of guesses, conragts player 1!'
  end
  $z += 1
end

my_board.print_board
