# frozen_string_literal: false

# Global var
 
$game_over = 0

# The board class
class Board
  @@x = -1
  @@y = -1
  
  def initialize(first, second, third, fourth)
    @board = Array.new(5) { Array.new(4) { |_n| '-' } }
    @winning_combo = []
    @winning_combo = [first, second, third, fourth]
  end

  def add_colors(one, two, three, four)
    @@x += 1
    @board[@@x] = [one, two, three, four]
  end

  def print_board
    puts ''
    @board.each do |array|
      puts "#{array} \n"
    end
    puts ''
  end

  def is_full?
    true if @board.all? { |row| !row.include?('-') }
  end

  def winner
    @@y += 1
    right_position = @board[@@y].each_with_index.select { |item, index| @winning_combo[index] == item }.map(&:first)
    wrong_position = @board[@@y].select { |i| @winning_combo.include?(i) && !right_position.include?(i) }

    # If character is correct and in correct position
    case right_position.length
    when 4
      puts 'Congratulations player 2 you have won this game of Mastermind!'
      puts ''
      $game_over = 1
    when 2..3
      puts "#{right_position.join(' and ').capitalize} are correct and in the right positions."
      puts ''
    when 1
      puts "#{right_position.join('').capitalize} is correct and in the correct position."
      puts ''
    end

    # If character is correct but not in correct position
    case wrong_position.length
    when 4
      puts 'They are all correct but not in the right positions.'
      puts ''
    when 2..3
      puts "#{wrong_position.join(' and ').capitalize} are correct but in the wrong position."
      puts ''
    when 1
      puts "#{wrong_position.join('').capitalize} is correct but in the wrong position."
      puts ''
    end
  end
end

puts 'Lets play Mastermind'
puts ''
puts 'Player 1 will choose a combination of 4 color.'
puts ''
puts 'Player 2 will try to input the 4 correct colors in the correct order.'
puts ''

options = %w[red green blue yellow magenta cayan white]
puts 'These are all the colors you chan choose from:'

options.each do |color|
  puts " - #{color.capitalize}\n"
end

puts 'Player 1 the combination of 4 colors, each sepearted by a space.'
colors = gets.chomp.downcase.split

until colors.all? { |color| options.include?(color) } && colors.size == 4
  puts 'There must be 4 colors, they must be from the list above and be spelt correctly.'
  puts ''
  puts 'Player 1 the combination of 4 colors, each sepearted by a space.'
  colors = gets.chomp.downcase.split
  puts ''
  color_one, color_two, color_three, color_four = colors
end

color_one, color_two, color_three, color_four = colors


board = Board.new(color_one, color_two, color_three, color_four)
board.print_board

until $game_over == 1
  puts 'Player 2 input the 4 correct colors, each sepearted by a space.'
  guesses = gets.chomp.downcase.split

  until guesses.all? { |guess| options.include?(guess) } && guesses.size == 4
    puts 'There must be 4 colors, they must be from the list above and be spelt correctly.'
    puts ''
    puts 'Player 2 input the 4 correct colors, eacb sepearted by a space.'
    guesses = gets.chomp.downcase.split
    puts ''
    guess_one, guess_two, guess_three, guess_four = guesses
  end

  guess_one, guess_two, guess_three, guess_four = guesses

  board.add_colors(guess_one, guess_two, guess_three, guess_four)

  board.winner

  board.print_board

  if board.is_full?
    puts ''
    puts 'Conratulations player 1 you have won this game of Mastermind!'
    puts ''
    $game_over = 1
  end
end