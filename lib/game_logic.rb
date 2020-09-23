# class board
#   def initialize(board)
#     @board = board
#   end


# end

board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]

# choice = 3
current_player = 1
def modify_board(board, current_player, choice)
  current_player == 1 ? modify = 'X' : modify = 'O'
  board.length.times do |i|
    if (choice <= 3)
      board[0][choice - 1] == '_' ? board[0][choice - 1] = modify : ask_player_for_choice()
    elsif choice <= 6
      board[1][(choice - 4)] = modify
    else
      board[2][(choice - 7)] = modify
    end
    p board[i]
  end
end
modify_board(board, current_player, 8)
def check_if_won(board, current_player, choice)
  modify_board(board, current_player, choice)
  wonX = [%w[X X X,_ _ _,_ _ _], %w[_ _ _,X X X,_ _ _], %w[_ _ _, _ _ _, X X X], %w[X _ _,X _ _,X _ _], %w[_ X _,_ X _,_ X _], %w[_ _ X, _ _ X, _ _ X], %w[X _ _,_ X _,_ _ X], %w[_ _ X,_ X _,X _ _]]

end
# 1...9
=begin
choice = 7
def sanitize_choice(choice)
  ((choice.is_a? Integer) && ( (choice >= 1) && (choice <= 9))) ? choice : "You must enter an integer number between 1 and 9 as your choice"
end
puts sanitize_choice(choice)
=end

def ask_player_for_choice
  puts "Enter a choice: "
  choice = gets.chomp
  sanitize_choice(choice) == choice ?
end
