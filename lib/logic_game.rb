class Board
  attr_reader :rows
  attr_accessor :available_cells
  def initialize
    @rows = [%w[_ _ X], %w[X X _], %w[_ _ X]]
    @available_cells = 9
  end

  def display
    @rows.length.times do |i|
      @rows[i].length.times do |j|
        if j == 2
          puts @rows[i][j]
        else
          print @rows[i][j] + ' '
        end
      end
    end
  end

  def update()
    puts @rows[0][1]
  end

  def valid_cell?(choice)
    case choice
    when 1
      @rows[0][0] == '_' ? true : false
    when 2
      @rows[0][1] == '_' ? true : false
    when 3
      @rows[0][2] == '_' ? true : false
    when 4
      @rows[1][0] == '_' ? true : false
    when 5
      @rows[1][1] == '_' ? true : false
    when 6
      @rows[1][2] == '_' ? true : false
    when 7
      @rows[2][0] == '_' ? true : false
    when 8
      @rows[2][1] == '_' ? true : false
    when 9
      @rows[2][2] == '_' ? true : false
    else
      false
    end
  end

  def rows_match?
    result = []
    @rows.each do |row|
      result.push(row.all?('X') || row.all?('O'))
    end
    result.any?(true) ? true : false
  end

  def columns_match?
    (@rows[0][0] == @rows[1][0] && @rows[1][0] == @rows[2][0]) || (@rows[0][1] == @rows[1][1] && @rows[1][1] == @rows[2][1]) || (@rows[0][2] == @rows[1][2] && @rows[1][2] == @rows[2][2]) ? true : false
  end

  def diagonals_match?
      (@rows[0][0] == @rows[1][1] && @rows[1][1] == @rows[2][2]) || (@rows[0][2] == @rows[1][1] && @rows[1][1] == @rows[2][0]) ? true : false
  end

  def draw?()
    (rows_match? == false) && (columns_match? == false) && (diagonals_match? == false)  && (@available_cells == 0) ? true : false
  end

  def win?
      (rows_match? == true) || (columns_match? == true) || (diagonals_match? == true) ? true : false
  end
end

new_game = Board.new
puts new_game.rows_match?
puts new_game.diagonals_match?
puts new_game.columns_match?
puts new_game.win?
puts new_game.valid_cell?(3)


# modify rows, current_player, 8)
# def check_if_won rows, current_player, choice)
#   modify rows, current_player, choice)
#   wonX = [%w[X X X,_ _ _,_ _ _], %w[_ _ _,X X X,_ _ _], %w[_ _ _, _ _ _, X X X], %w[X _ _,X _ _,X _ _], %w[_ X _,_ X _,_ X _], %w[_ _ X, _ _ X, _ _ X], %w[X _ _,_ X _,_ _ X], %w[_ _ X,_ X _,X _ _]]

# end

=begin
class ClassName
  hassh = { player1: 'X', player2: 'O'}
  def initialize(player_name)
    @player_name
    qcurrent_winner
  end
  def move(choice)
  end
  def winner
  end
end
=end
