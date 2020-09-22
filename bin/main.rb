#!/usr/bin/env ruby

# Ask for player names

player1_choice = ''
player2_choice = ''
answer = ''
game_on = true

def player_turn(player, player1_name, player2_name)
  if player == 1
    puts "It's your turn #{player1_name}. Make a move..."
  else
    puts "It's your turn #{player1_name}. Make a move..."
  end
end

def game_confirmation(answer)
  while (answer != 'y') && (answer != 'n')
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
  end
  (answer == 'y') ? true : false
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


## Here, the game starts
puts 'Welcome to our game: Tic Tac Toe'
game_confirmation
if game_confirmation #If it's true, we start the game
  # Here, we request for player's information
  player1_name, player2_name = request_players_info
  game_on = true
  # Then, we create new objects (player1 and player2), with the given players' names
  # player1 = new player(player1_name)
  # player2 = new player(player2_name)

else # If game confirmation returns false (that is: if the user chose 'n'), we say good bye!
  puts "good bye!..."
  game_on = false
end

explain_game
player = rand(1..2)

while game_on
    valid_choice = false
  # until validate_choice == true
      # Tell player that it is his/her turn (call player_turn function)
      # player_turn(player, player1_name, player2_name)
      # display_board to show available moves
      # Ask for player choice
      # Validate the player's choice
      # valid_choice = validate_choice(player_choice, player) returns true or false
      # if valid_choice == true
      #   switch the 'player' variable: player == 1 ? player = 2 : player = 1
      #   make the move: modify_board(player, player_choice)
      #   if winning_move ?
            #  game_on = false
            #  Display message saying that current player won the match
            #  Congratulate player and get out of the program
      #   elsif draw?
            #  game_on = false
            # Display message saying that it was a draw
            # Congratulate players and get out of the program
      #   else do nothing (game_on continues to be true)

      # elsif (valid_choice == false)
      #   Display an error, saying that it was an invalid choice, and ask again
  # end
end
