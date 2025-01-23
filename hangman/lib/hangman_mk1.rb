# frozen_string_literal: false

$game_over = 0
$random_word = nil
$save_game = nil
words = []

# Gets a random word from the google-english.txt file that has between 5 and 12 letters in it
Dir.mkdir('unfinished_games') unless Dir.exist?('unfinished_games')
File.foreach('google-10000-english-no-swears.txt')
File.open('google-10000-english-no-swears.txt', 'r') do |file|
  file.read.split.each { |item| words << item if item.length.between?(5, 12) }
  $random_word = words[rand(1..7557)]
end

# The board class
class Board
  def initialize(word)
    @board = Array.new(word.length, '_')
    @correct_word = word
    @wrong_guesses = []
    @guesses_left = word.length + 7
  end

  # Prints the board and makes it look a bit more appealing
  def print_board
    space_from_wall = 20
    puts ''
    puts ''
    puts ''
    puts ''
    print ''.center(space_from_wall)
    @board.each do |item|
      print "#{item}   "
    end
    puts ''
    puts ''
    puts ''
    puts ''
    puts "Wrong letters = #{@wrong_guesses.join(', ')}"
    puts "Guesses left = #{@guesses_left}"
  end

  # Move functionality
  def move(letter = '_')
    if !@wrong_guesses.include?(letter) && !@board.include?(letter)
      @guesses_left -= 1
      puts ''
      @correct_word.split('').each_with_index do |item, index|
        @board[index] = item if letter == item
        @wrong_guesses << letter if !@correct_word.include?(letter) && !@wrong_guesses.include?(letter)
      end
    else
      puts 'You have already inputed that letter before.'
    end
  end

  # Check is the player as guess the word or is out of guesses
  def winner
    if !@board.include?('_')
      puts 'Congratualtions you guessed the word!'
      $game_over = 1
    elsif @guesses_left.zero?
      puts "Sorry you're out of guesses, the correct word was #{@correct_word.capitalize}."
      $game_over = 1
    end
  end

  # Saves the game as a text file with the user choosing the name of the file
  def save_game(file_name)
    Dir.chdir('unfinished_games')
    File.open("#{file_name}.txt", 'w') unless File.exist?("#{file_name}.txt")

    File.open("#{file_name}.txt", 'w') do |file|
      file.puts(@board.join(', '))
      file.puts(@guesses_left)
      file.puts(@wrong_guesses.join(', '))
      file.puts(@correct_word)
    end
    Dir.chdir('..')
  end

  # Update the board if a previous game is loaded
  def update_game(board, guesses, wrong_guesses, correct_word)
    @board = board
    @guesses_left = guesses
    @wrong_guesses = wrong_guesses
    @correct_word = correct_word
    puts ''
    puts 'Updating board...'
    puts ''
    print_board
  end
end

board = Board.new($random_word)

puts ''
puts 'Lets play Hangman!'
puts ''
puts 'Wrong letters will have all the incorrect letters you have chosen.'
puts ''
puts 'This is the board you will be playing on, each dash is a place for a letter.'
board.print_board
puts ''
puts 'You can guess one letter at a time and only have a certain number of guesses to get it right.'
puts ''
puts 'Lets begin:'
puts ''

puts 'If you want to open a previous game input its name below, if not input the word continue.'
unfinished_game = gets.chomp.downcase

Dir.chdir('unfinished_games')

until File.exist?("#{unfinished_game}.txt") || unfinished_game.include?('continue')
  puts ''
  puts 'Input a valid file name or spell continue correctly'
  unfinished_game = gets.chomp.downcase
end

# Changes previous text files into ruby code that works
unless unfinished_game.include?('continue')
  game_details = []
  puts "Opening #{unfinished_game}.txt"
  File.foreach("#{unfinished_game}.txt") { |line| game_details << line.chomp }

  # Sets the board and wrong guess to seperate arrays and turns guesses left to an integer
  new_board = game_details[0].split(', ')
  guesses = game_details[1].to_i
  wrong_ones = game_details[2].split(', ')
  correct_one = game_details[3]
  board.update_game(new_board, guesses, wrong_ones, correct_one)
  puts ''
  Dir.chdir('..')
end

until $game_over == 1

  puts ''
  puts 'Input letter'
  letter = gets.chomp.downcase

  if letter.include?('save')
    puts ''
    puts 'Choose name for current game'
    file_name = gets.chomp.downcase
    while file_name.include?('.')
      puts 'The name of your file cannot include the . character.'
      puts ''
      puts 'Choose name for current game'
      file_name = gets.chomp.downcase
    end
    puts ''
    puts "Saving and closing this game (File name = '#{file_name}')."
    board.save_game(file_name)
    $game_over = 1
  else
    until letter.between?('a', 'z') && letter.length == 1
      puts 'You can only guess one letter at a time.'
      puts ''
      puts 'Input letter'
      letter = gets.chomp.downcase
    end
    board.move(letter)
    board.print_board
    puts ''
    board.winner
  end
  puts ''
  sleep 0.3
end
