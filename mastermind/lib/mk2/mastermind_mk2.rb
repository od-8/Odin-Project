# frozen_string_literal: false

require 'colorize'

$game_over = 0

# The board class
class Board
  def initialize(one, two, three, four)
    @board = Array.new(6) { Array.new(4, '-') }
    @mini_board = Array.new(4) { |n| n + 1}
    @winning_combo = [one, two, three, four]
    @w = -1
    @i = -1
    puts ''
    puts "@winning_combo = #{@winning_combo}"
  end

  def move(one, two, three, four)
    @w += 1
    @board[@w] = [one, two, three, four]
    puts "@w = #{@w}"
  end

  def print_board
    puts ''
    p @board.flatten
    puts '+---+---+---+---+'
    @board.each_with_index do |row, i|
      if row.all? { |cell| cell != '-' }
        row.each do |color|
          print "| #{'X'.colorize(color.to_sym)} "
        end
      else
        print "| #{row.join(' | ')} "
      end
      print '|'
      print "    [ #{@mini_board.join(', ')} ]"
      puts "\n+---+---+---+---+"
    end
    puts ''
  end

  def position
    @i += 1
    right_position = @board[@i].each_with_index.select { |item, index| @winning_combo[index] == item }.map(&:first)
    wrong_position = @board[@i].select { |i| @winning_combo.include?(i) && !right_position.include?(i) }

    right_position_size = right_position.length
    wrong_position_size = wrong_position.length

    case right_position_size
    when 4
      puts 'Congratulations Player 1 you guessed the combination in time, you have won!'
      $game_over = 1
    when 2 || 3
      puts "#{right_position.join(' and ').capitalize} are correct and in the right positions."
      puts ''
    when 1
      puts "#{right_position.join('').capitalize} is correct and in the correct position."
      puts ''
    end

    case wrong_position_size
    when 4
      puts 'They are all correct but not in the right positions.'
    when 2 || 3
      puts "#{wrong_position.join(' and ').capitalize} are correct but in the wrong position."
      puts ''
    when 1
      puts "#{wrong_position.join('').capitalize} is correct but in the wrong position."
      puts ''
    end
  end

  def full?
    if @board.flatten.all? { |i| i != '-'}
      puts 'Player 1 you are out of guesses, congratulations Player 2 you have won!'
      $game_over = 1
    end
  end
end

puts ''
puts 'Input winning combo'
puts 'Color 1'
color_one = gets.chomp.downcase
puts ''
puts 'Color 2'
color_two = gets.chomp.downcase
puts ''
puts 'Color 3'
color_three = gets.chomp.downcase
puts ''
puts 'Color 4'
color_four = gets.chomp.downcase

board = Board.new(color_one, color_two, color_three, color_four)

until $game_over == 1
  puts 'Input four guess'
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

  board.move(guess_one, guess_two, guess_three, guess_four)

  board.print_board

  board.position

  board.full?
end
