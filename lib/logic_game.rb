class Board
  attr_reader :rows
  attr_accessor :available_cells
  def initialize
    @rows = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
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
    puts ''
  end

  def update()
    
  end

  def valid_cell?()
    
  end

  def rows_match?()
    
  end

  def diagonals_match?()
    
  end

  def draw?()
    
  end
end

new_game = Board.new
p new_game.display