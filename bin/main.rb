

# Ask for player names
puts "Welcome to our game: Tic Tac Toe"
puts "Do you want to play? (Y/N)"
answer = gets.chomp.downcase

def explain_game
  puts "The game is played on a grid that's 3 squares by 3 squares."
  puts "You are X, your friend is O."
  puts "Players take turns putting their marks in empty squares."
  puts "The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner."
  puts "When all 9 squares are full, the game is over."
end

while (answer == 'y') || (answer == 'n')
  player1_name = ''
  player2_name = ''
  if answer == 'y'
    # Play the game
    print "Enter the name of player 1: "
    player1_name = gets.chomp
    print "Enter the name of player 2: "
    player2_name = gets.chomp
    puts "The player who will start the game will be chosen randomly"
    puts "I am thinking..."
    sleep(3)
    choice = rand(1..2)
    if choice == 1
      puts "#{player1_name} will start, with X!"
      explain_game
    else
      puts "#{player2_name} will start, with O!"
      explain_game
    end

    # The game begins
    puts "The game begins..."

  else
    puts 'Goodbye!'
  end
  break
end
