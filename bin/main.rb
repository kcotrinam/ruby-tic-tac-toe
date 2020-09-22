#!/usr/bin/env ruby

# Ask for player names

player1_choice = ''
player2_choice = ''
answer = ''
game_on = true

def game_confirmation(answer)
  while (answer != 'y') && (answer != 'n')
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
  end
  (answer != 'y') && (answer != 'n') ? true : false
end

def request_players_info
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp
  return player1_name, player2_name
end

def ask_choice(player, player1_name, player2_name)
  if player == 1
    puts "#{player1_name}, it is your turn. Choose a square"
    player1_choice = gets.chomp
    # We verify that the choice is valid
    # verify_choice(player1_choice): it will return true or false
    # if verify_choice(player1_choice) == true
      # return player1_choice
    # else
      # we ask again
  else
    puts "#{player2_name}, it is your turn. Choose a square"
    player2_choice = gets.chomp
    # We verify that the choice is valid
    # verify_choice(player2_choice): it will return true or false
    # if verify_choice(player2_choice) == true
      # return player2_choice
    # else
      # we ask again
  end
  # display_board
  # display_board
end

puts 'Welcome to our game: Tic Tac Toe'
game_confirmation
if game_confirmation
  print 'Enter the name of player 1: '
  player1_name = gets.chomp
  print 'Enter the name of player 2: '
  player2_name = gets.chomp
  # player = new player(player1_name)
  # player = new player(player2_name)
else
  puts "good bye!..."
end

while game_on
# player_turn
# display_board
# player choice
# # loop for each move
  valid_choice = false
  until valid_choice#(player choice)
    
  #  # valid_choice = true if ask_choice
  end
  if player == 1
  #  player1_choice = ask_choice
  else
  ## player2_choice = ask_choice
  end
#     
  if winner # and/or draw
    #   game_on = false
  end
end


puts 'the winner is...'
# Game.winner