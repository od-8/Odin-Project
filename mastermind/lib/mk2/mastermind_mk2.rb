# frozen_string_literal: false

require 'colorize'

$game_over = 0

# The board class
class Board
  def initialize(one = nil, two = nil, three = nil, four = nil)
    @board = Array.new(10) { Array.new(4, '-') }
    @mini_board = Array.new(4) { |n| n + 1 }
    @winning_combo = [one, two, three, four]
    @legal_colors = %w[blue red green yellow cyan magenta black]
    @w = -1
    @i = -1
    puts ''
  end

  def move(one, two, three, four)
    @w += 1
    @board[@w] = [one, two, three, four]
  end

  def print_board
    puts ''
    puts '+---+---+---+---+'
    @board.each_with_index do |row, _i|
      if row.all? { |cell| cell != '-' }
        row.each do |color|
          print "| #{'X'.colorize(color.to_sym)} "
        end
      else
        print "| #{row.join(' | ')} "
      end
      row.each_with_index do |item, index|
        print '|  '
        if @winning_combo[index] == item
          print "|#{@mini_board[index].to_s.colorize(:green)}"
        elsif @winning_combo.include?(item) && @winning_combo[index] != item
          print "|#{@mini_board[index].to_s.colorize(:yellow)}"
        else
          print "|#{@mini_board[index]}"
        end
      end
      print '|'
      puts "\n+---+---+---+---+"
    end
    puts ''
  end

  def winner?
    @i += 1
    right_position = @board[@i].each_with_index.select { |item, index| @winning_combo[index] == item }.map(&:first)
    return unless right_position.length == 4

    puts 'Congratulations Player 1 you guessed the combination in time, you have won!'
    puts ''
    $game_over = 1
  end

  def full?
    return unless @board.flatten.all? { |i| i != '-' }

    puts 'Player 1 you are out of guesses, congratulations Player 2 you have won!'
    puts ''
    $game_over = 1
  end

  def legal_move?(one, two, three, four)
    if @legal_colors.include?(one) && @legal_colors.include?(two) && @legal_colors.include?(three) && @legal_colors.include?(four)
      true
    end
  end
end

starter_board = Board.new

puts ''
puts 'Lets play mastermind'
puts ''
puts 'This is the board:'
puts 'The numbers on the left are correlated to the positions of the board on the same row.'
starter_board.print_board
puts ''

puts ''
puts 'Player 1 will be guessing.'
puts ''
puts 'Player 2 will input the winning combonations.'
puts ''
puts 'Player 2:'
puts '- Input the winnning four color combination'
puts '- You win if Player 1 runs out of guesses'
puts ''
puts ''
puts 'Player 1:'
puts '- Input your four color guess untill you win or the board is full'
puts '- You win if you input the four correct color combination'
puts ''
puts 'All the colors you input must be in the list bellow'
puts ''
puts 'Colors: '
possible_colors = %w[blue red green yellow cyan magenta black]
possible_colors.each do |item|
  puts "- #{item.capitalize.colorize(item.to_sym)}"
end
puts ''

puts ''
puts 'Player 2 input the winning combination'
puts 'Color one:'
color_one = gets.chomp.downcase
puts ''
puts 'Color two:'
color_two = gets.chomp.downcase
puts ''
puts 'Color three:'
color_three = gets.chomp.downcase
puts ''
puts 'Color four:'
color_four = gets.chomp.downcase

until starter_board.legal_move?(color_one, color_two, color_three, color_four)
  puts 'There must be 4 colors, they all must be spelt correctly(case insensitive) and they must be from the list above.'
  puts ''
  puts 'Player 2 input the winning combination'
  puts 'Color one:'
  color_one = gets.chomp.downcase
  puts ''
  puts 'Color two:'
  color_two = gets.chomp.downcase
  puts ''
  puts 'Color three:'
  color_three = gets.chomp.downcase
  puts ''
  puts 'Color four:'
  color_four = gets.chomp.downcase
  puts ''
end

board = Board.new(color_one, color_two, color_three, color_four)

until $game_over == 1
  puts 'Player 1 input your four guesses'
  puts 'Guess one:'
  guess_one = gets.chomp.downcase
  puts ''
  puts 'Guess two:'
  guess_two = gets.chomp.downcase
  puts ''
  puts 'Guess three:'
  guess_three = gets.chomp.downcase
  puts ''
  puts 'Guess four:'
  guess_four = gets.chomp.downcase
  puts ''
  until board.legal_move?(guess_one, guess_two, guess_three, guess_four)
    puts 'There must be 4 colors, they must all be spelt correctly(case insensitive) and they must be from the list above.'
    puts ''
    puts 'Player 1 input your four guesses'
    puts 'Guess 1'
    guess_one = gets.chomp.downcase
    puts ''
    puts 'Guess 2'
    guess_two = gets.chomp.downcase
    puts ''
    puts 'Guess 3'
    guess_three = gets.chomp.downcase
    puts ''
    puts 'Guess 4'
    guess_four = gets.chomp.downcase
    puts ''
  end
  board.move(guess_one, guess_two, guess_three, guess_four)
  board.print_board
  board.winner?
  board.full?
end
