#!/usr/bin/env ruby
require '../lib/logic_game.rb'
# Ask for player names
player1_name = ''
player2_name = ''
answer = ''

def game_confirmation(answer)
  puts 'Do you want to play? (Y/N)'
  answer = gets.chomp.downcase
end

def explain_game
  puts "1. The game is played on a grid that's 3 squares by 3 squares."
  puts '2. Player 1 is X and player 2 is O.'
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

def win_or_draw?(board, player_name)
  if board.win?
    puts "Hey, #{player_name}, you won!!!"
    return true
  elsif board.draw?
    puts "It's a draw!!!"
    return true
  end
  return false
end

def choice_validator(player, choice, new_board)
  player.sanitize_choice(choice) && new_board.valid_cell?(choice) ? true : false
end

def init_game
  turn = rand(1..2)
  new_board = Board.new
  explain_game
  player1 = Player.new
  player1.player_movement = 'X'
  player2 = Player.new
  player2.player_movement = 'O'
  player1.name, player2.name = request_players_info(turn)
  return new_board, player1, player2, turn
end

def game_start(answer, player1, player2, turn, new_board)
  game_on = true
  counter = 1
  player1_name = player1.name
  player2_name = player2.name
  while game_on
    game_on = false unless counter <= 9
    if turn == 1
      puts "#{player1_name}, it's you turn choose a square"
      player_choice = gets.chomp.to_i
      if choice_validator(player1, player_choice, new_board)
        new_board.update(player_choice, 'X')
        game_on = !win_or_draw?(new_board, player1.name)
      else
        until choice_validator(player1, player_choice, new_board)
          puts 'Incorrect choice, please choose a number from 1 to 9: '
          player_choice = gets.chomp.to_i
          new_board.display
        end
        new_board.update(player_choice, 'X')
      end
      new_board.display
      turn = 2
    else
      puts "#{player2_name}, it's you turn choose a square"
      player_choice = gets.chomp.to_i
      if choice_validator(player2, player_choice, new_board)
        new_board.update(player_choice, 'O')
        game_on = !win_or_draw?(new_board, player2.name)
      else
        until choice_validator(player2, player_choice, new_board)
          puts 'Incorrect choice, please choose a number from 1 to 9: '
          player_choice = gets.chomp.to_i
        end
        new_board.update(player_choice, 'O')
      end
      new_board.display
      turn = 1
    end
    counter += 1
  end
  puts 'The final result is: '
  new_board.display
  play_again(answer, player1_name, player2_name, turn)
end

def play_again(answer, player1_name, player2_name, turn)
  puts 'Do you want to play again? (Y/N)'
  new_game = gets.chomp.downcase
  while new_game != 'y' && new_game != 'n'
    puts "It's not a correct option, chose... (Y/N)"
    new_game = gets.chomp.downcase
  end
  if new_game == 'y'
    new_board, player1, player2, turn = init_game
    game_start(answer, player1, player2, turn, new_board)
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
  new_board, player1, player2, turn = init_game
  game_start(answer, player1, player2, turn, new_board)
end
