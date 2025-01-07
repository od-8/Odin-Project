# frozen_string_literal: false

require 'colorize'

# The board class
class Board
  def initialize(one, two, three, four)
    @board = Array.new(6) { Array.new(4) { |_n| '-' } }
    @mini_board = Array.new(4) { |n| n + 1}
    @winning_combo = [one, two, three, four]
    @w = 0
    puts ''
    puts "@winning_combo = #{@winning_combo}"
  end

  def move(one, two, three, four)
    @one = one
    @two = two
    @three = three
    @four = four
    @board[@w] = %w[X X X X]
    @w += 1
  end

  def print_board
    i = 0
    puts ''
    puts '+---+---+---+---+'
    @board.length.times do
      if @board[i].all? { |let| let == 'X'}
        print "| #{@board[i][0].colorize(@one.to_sym)} "
        print "| #{@board[i][1].colorize(@two.to_sym)} "
        print "| #{@board[i][2].colorize(@three.to_sym)} "
        print "| #{@board[i][3].colorize(@four.to_sym)} |"
        puts "\n+---+---+---+---+"
        i += 1 # rubocop:disable Style/IdenticalConditionalBranches
      else
        print "| #{@board[i][0..3].join(' | ')} "
        print '|'
        puts "\n+---+---+---+---+"
        i += 1 # rubocop:disable Style/IdenticalConditionalBranches
      end
    end
  end
end

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

# board.print_board(color_one, color_two, color_three, color_four)

# puts ''
# puts ''
# puts ''
# puts 'string'.colorize(:green)
# puts 'string'.colorize(:red)
# puts 'string'.colorize(:blue)
# puts 'string'.colorize(:yellow)
# puts 'string'.colorize(:magenta)
# puts 'string'.colorize(:cyan)
# puts 'string'.colorize(:black)
# puts 'string'.colorize(:white)

i = 0
while i < 3
  i += 1
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
  sleep 3
end
