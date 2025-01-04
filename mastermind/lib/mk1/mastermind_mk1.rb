# frozen_string_literal: false

require 'colorize'

# Global vars
$i = -1
$rp = -1
$game_over = -1
$num = 0

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
    puts ''
    @board.each do |array|
      puts "#{array} \n"
    end
    puts ''
  end

  def add_colors(one, two, three, four)
    $i += 1
    @board[$i][0] = one
    @board[$i][1] = two
    @board[$i][2] = three
    @board[$i][3] = four
  end

  # This checks if the input is valid
  def real_color?(colors, input)
    true if colors.include?(input)
  end

  def correct
    $rp += 1
    right_position = @board[$rp].each_with_index.select { |item, index| @winning_combo[index] == item }.map(&:first)
    wrong_position = @board[$rp].select { |i| @winning_combo.include?(i) && !right_position.include?(i) }
    right_position_size = right_position.length
    wrong_position_size = wrong_position.length

    if right_position_size == 4
      puts 'Congratulations Player 1 you have won.'
      puts ''
      $game_over = 1
    elsif right_position_size.between?(2, 3)
      puts "#{right_position.join(' and ').capitalize} are correct and in the right positions."
      puts ''
    elsif right_position_size == 1
      puts "#{right_position.join('').capitalize} is correct and in the correct position."
      puts ''
    end

    if wrong_position_size == 4
      puts 'They are all correct but not in the right positions.'
      puts ''
    elsif wrong_position_size.between?(2, 4)
      puts "#{wrong_position.join(' and ').capitalize} are correct but in the wrong position."
      puts ''
    elsif wrong_position_size == 1
      puts "#{wrong_position.join('').capitalize} is correct but in the wrong position."
      puts ''
    end
  end

  def full
    unless !@board[0].include?('-') && !@board[1].include?('-') && !@board[2].include?('-') && !@board[3].include?('-') && !@board[4].include?('-')
      return
    end

    puts 'Player 2, you could not guess the correct combination of colors so Player 1 you win!'
    $game_over = 1
  end
end

puts 'Lets play mastermind'
puts ''
puts 'Player 1 will be guessing.'
puts ''
puts 'player 2 will try to input the 4 correct colors.'
puts ''

colors = %w[red green blue yellow magenta cayan white]
puts 'These are all the colors you chan choose from:'

colors.each do |color|
  puts " - #{color.capitalize}\n"
end

puts ''
puts 'Player 1, input the first color'
color_one = gets.chomp.downcase
puts ''

until colors.include?(color_one)
  puts 'That is not a valid color, Choose one from the list above.'
  puts 'Player 1 input your first color.'
  color_one = gets.chomp.downcase
  puts ''
end

puts 'Player 1, input the second color'
color_two = gets.chomp.downcase
puts ''

until colors.include?(color_two)
  puts 'That is not a valid color, Choose one from the list above.'
  puts 'Player 1 input your second color.'
  color_two = gets.chomp.downcase
  puts ''
end

puts 'Player 1, input the third color'
color_three = gets.chomp.downcase
puts ''

until colors.include?(color_three)
  puts 'That is not a valid color, Choose one from the list above.'
  puts 'Player 1 input your third color.'
  color_three = gets.chomp.downcase
  puts ''
end

puts 'Player 1, input the fourth color'
color_four = gets.chomp.downcase
puts ''

until colors.include?(color_four)
  puts 'That is not a valid color, Choose one from the list above.'
  puts 'Player 1 input your fourth color.'
  color_four = gets.chomp.downcase
  puts ''
end

my_board = Board.new(color_one, color_two, color_three, color_four)
my_board.print_board

until $game_over == 1
  $num += 1
  puts "Num = #{$num}"
  puts 'Player 2 Input your first guess'
  guess_one = gets.chomp.downcase
  puts ''

  until my_board.real_color?(colors, guess_one)
    puts 'That is not a valid color, Choose one from the list above.'
    puts 'Player 2 input your first guess'
    guess_one = gets.chomp.downcase
    puts ''
  end

  puts 'Player 2 input your second guess'
  guess_two = gets.chomp.downcase
  puts ''

  until my_board.real_color?(colors, guess_two)
    puts 'That is not a valid color, Choose one from the list above.'
    puts 'Player 2 input your second guess'
    guess_two = gets.chomp.downcase
    puts ''
  end

  puts 'Player 2 input your third guess'
  guess_three = gets.chomp.downcase
  puts ''

  until my_board.real_color?(colors, guess_three)
    puts 'That is not a valid color, Choose one from the list above.'
    puts 'Player 2 input your third guess'
    guess_three = gets.chomp.downcase
    puts ''
  end

  puts 'Player 2 input your fourth guess'
  guess_four = gets.chomp.downcase
  puts ''

  until my_board.real_color?(colors, guess_four)
    puts 'That is not a valid color, Choose one from the list above.'
    puts 'Player 2 input your fourth guess'
    guess_four = gets.chomp.downcase
    puts ''
  end

  my_board.add_colors(guess_one, guess_two, guess_three, guess_four)

  my_board.print_board

  my_board.correct

  my_board.full
end
