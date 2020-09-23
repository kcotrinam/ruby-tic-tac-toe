#!/usr/bin/env ruby
require '../lib/logic_game.rb'
# Ask for player names

player1_name = ''
player2_name = ''

answer = ''
turn = rand(1..2)

def game_confirmation(answer)
  puts 'Do you want to play? (Y/N)'
  answer = gets.chomp.downcase
end

def explain_game
  puts "1. The game is played on a grid that's 3 squares by 3 squares."
  puts '2. You are X, your friend is O.'
  puts '3. Players take turns putting their marks in empty squares.'
  puts '4. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.'
  puts '5. When all 9 squares are full, the game is over.'
end

def request_players_info(start)
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp
  puts 'The player who will start the game will be chosen randomly'
  puts 'I am thinking...'
  sleep(3)
  puts start == 1 ? "#{player1_name} will start, with X!" : "#{player2_name} will start, with O!"
  return player1_name, player2_name
end

def winning_move(player1_choice)
  return false
end

def draw_move(player1_choice)
  return false
end

def choice_validator(player, choice, new_board)
  while !player.sanitize_choice(choice)
    puts "The choice is incorrect."
    puts "#{player.player_name}, please choose an empty square, with a number between 1 and 9"
    new_board.display
    choice = gets.chomp.to_i
  end
  while !new_board.valid_cell?(choice)
    puts "The choice is incorrect. The cell is not empty."
    puts "#{player.player_name}, please choose an empty square, with a number between 1 and 9"
    new_board.display
    choice = gets.chomp.to_i
  end
  (player.sanitize_choice(choice) && new_board.valid_cell?(choice)) ? true : false
end

def game_start(answer, player1, player2, turn, new_board)

  value1 = nil
  game_on = true
  counter = 1
  player1_name = player1.player_name
  player2_name = player2.player_name
  while game_on
    game_on = false unless counter <= 3
    if turn == 1
      puts "#{player1_name}, It's you turn choose a square"
      player1_choice = gets.chomp.to_i
      choice_validator(player1, player1_choice, new_board)
      if ((player1.sanitize_choice(player1_choice) && new_board.valid_cell?(player1_choice)) ? true : false)
        puts "Inside p1 if..."
        new_board.update(player1_choice,'X')
      end
      new_board.display
      turn = 2
    else
      puts "#{player2_name}, It's you turn choose a square"
      player2_choice = gets.chomp.to_i
      choice_validator(player2, player2_choice, new_board)
      if ((player1.sanitize_choice(player2_choice) && new_board.valid_cell?(player2_choice)) ? true : false)
        puts "!!!!!!!!!!!!!!!!!!!!!!"
        puts choice_validator(player2, player2_choice, new_board)
        puts "The board before is..."
        new_board.display
        new_board.update(player2_choice,'O')
        puts "The board after is..."
        new_board.display
        puts "====================="
      end
      new_board.display
      turn = 1
    end
    counter += 1
  end
  puts 'The final result is: '
  new_board.display
  puts 'The winner is...'
  play_again(answer, player1_name, player2_name)
end

=begin
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
=end

def play_again(answer, player1_name, player2_name)
  puts 'Do you want to play again? (Y/N)'
  new_game = gets.chomp.downcase
  while new_game != 'y' && new_game != 'n'
    puts "It's not a correct option, chose... (Y/N)"
    new_game = gets.chomp.downcase
  end
  if new_game == 'y'
    game_start(answer, player1_name, player2_name, turn)
  else
    puts 'See you next time!'
  end
end

puts 'Welcome to our game: Tic Tac Toe'
answer = game_confirmation(answer)
answer = game_confirmation(answer) while (answer != 'y') && (answer != 'n')
if answer == 'n'
  puts 'Goodbye!'
  return
end
if answer == 'y'
  new_board = Board.new
  explain_game
  player1 = Player.new()
  player1.player_movement = 'X'
  player2 = Player.new
  player2.player_movement = 'O'
  player1.player_name, player2.player_name = request_players_info(turn)
  game_start(answer, player1, player2, turn, new_board)
end
