#!/usr/bin/env ruby

# Ask for player names

player1_name = ''
player2_name = ''
player1_choice = ''
player2_choice = ''
answer = ''
def game_confirmation(answer, player1_name, player2_name)
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
    return answer
    #game_start(answer, player1_name, player2_name)

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

def winning_move(player1_choice)
  return false
end
def draw_move(player1_choice)
  return true
end
def valid_choice
  return true
end



puts "In here..."




def game_start(answer, player1_name, player2_name)
  counter = 1
  puts 'The game begins...'
  while counter <= 3
    if counter <= 3
     until valid_choice do
      if (winning_move(player1_choice))
        puts "Congratulations, #{player1_name}, you won!"
        # Display the board
        # break
      end
      if (draw_move(player1_choice))
        puts "It's a draw."
        # Display the board
        # break
      end
      puts "#{player1_name}, It's you turn choose a square"
      player1_choice = gets.chomp
     end
    display_board
    # until (valid_choice(player1_choice) && (winning_move || drawing_move)) do
    puts "#{player2_name}, It's you turn choose a square"
    player2_choice = gets.chomp
    # end
    display_board
      puts 'The final result is: '
      display_board
      puts 'The winner is...'
      # play_again(answer, player1_name, player2_name)
      counter += 1
    else
      break
    end
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

# game_confirmation(answer, player1_name, player2_name)

puts 'Welcome to our game: Tic Tac Toe'
answer = game_confirmation(answer, player1_name, player2_name)

while (answer != 'y') && (answer != 'n')
  # puts "In here..."
  answer = game_confirmation(answer, player1_name, player2_name)
end
if answer == 'n'
  puts 'Goodbye!'
  return
end
if answer == 'y'
  explain_game
  player1_name, player2_name = request_players_info
  puts "Here in between"
  game_start(answer, player1_name, player2_name)
end
