#!/usr/bin/env ruby

# Ask for player names
puts 'Welcome to our game: Tic Tac Toe'
player1_name = ''
player2_name = ''
player1_choice = ''
player2_choice = ''
answer = ''

def game_confirmation(answer, player1_name, player2_name)
  while (answer != 'y') && (answer != 'n')
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
    game_start(answer, player1_name, player2_name)
  end
end

def explain_game
  puts "1. The game is played on a grid that's 3 squares by 3 squares."
  puts '2. You are X, your friend is O.'
  puts '3. Players take turns putting their marks in empty squares.'
  puts '4. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
  puts '5. When all 9 squares are full, the game is over.'
end

def request_players_info
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp
  puts 'The player who will start the game will be chosen randomly'
  puts 'I am thinking...'
  sleep(3)
  puts rand(1..2) == 1 ? "#{player1_name} will start, with X!" : "#{player2_name} will start, with O!"
  return player1_name, player2_name
end

def game_start(answer, player1_name, player2_name)
  if answer == 'y'
    # Play the game
    player1_name, player2_name = request_players_info
    explain_game
    # The game begins
    puts 'The game begins...'
    puts "#{player1_name} choose a square"
    player1_choice = gets.chomp
    # display_board
    display_board
    puts "#{player2_name} choose a square"
    player2_choice = gets.chomp
    display_board
    # After 9 plays at the most
    puts 'The final result is: '
    display_board
    puts 'The winner is...'
    play_again(answer, player1_name, player2_name)
  else
    puts 'Goodbye!'
  end
end

def display_board
  board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
  board.length.times do |i|
    board[i].length.times do |j|
      if j == 2
        puts board[i][j]
      else
        print board[i][j] + ' '
      end
    end
  end
  puts ''
end

def play_again(answer, player1_name, player2_name)
  puts 'Do you want to play again? (Y/N)'
  new_game = gets.chomp.downcase
  if new_game == 'y'
    game_start(answer, player1_name, player2_name)
  else
    p 'Good bye!'
  end
end

game_confirmation(answer, player1_name, player2_name)
