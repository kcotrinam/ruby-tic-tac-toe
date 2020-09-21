# class board
#   def initialize(board)
#     @board = board
#   end

#   def modify_board(current_player, choice)
 
#   end
 
# end

board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]

choice = 3

board.length.times do |i|
  if (choice <= 3) 
    board[0][choice - 1] = 'X'
  elsif choice <= 6
    board[1][(choice - 4)] = 'X'
  else
    board[2][(choice - 7)] = 'X'
  end
  p board[i]
end
