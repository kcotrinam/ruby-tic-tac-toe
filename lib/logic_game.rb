class Board
  attr_accessor :available_cells, :rows
  def initialize
    @rows = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
    @available_cells = 9
  end
  puts @rows

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

  def update(choice, token)
    @available_cells -= 1
    case choice
    when 1
      @rows[0][0] = token
    when 2
      @rows[0][1] = token
    when 3
      @rows[0][2] = token
    when 4
      @rows[1][0] = token
    when 5
      @rows[1][1] = token
    when 6
      @rows[1][2] = token
    when 7
      @rows[2][0] = token
    when 8
      @rows[2][1] = token
    when 9
      @rows[2][2] = token
    end
  end

  def valid_cell?(choice)
    case choice
    when 1
      @rows[0][0] == '_'
    when 2
      @rows[0][1] == '_'
    when 3
      @rows[0][2] == '_'
    when 4
      @rows[1][0] == '_'
    when 5
      @rows[1][1] == '_'
    when 6
      @rows[1][2] == '_'
    when 7
      @rows[2][0] == '_'
    when 8
      @rows[2][1] == '_'
    when 9
      @rows[2][2] == '_'
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
    cond1 = []
    cond2 = []
    cond3 = []
    @rows.length.times do|i|
      cond1.push(@rows[i][0])
      cond2.push(@rows[i][1])
      cond3.push(@rows[i][2])
    end
    puts cond1
    # puts cond2
    # puts cond3
    if cond1.all?('O') || cond1.all?('X')
      true
    elsif cond2.all?('O') || cond2.all?('X')
      true
    elsif cond3.all?('O') || cond3.all?('X')
      true
    else
      false
    end
  end

  def diagonals_match?
    condition1 = []
    condition2 = []
    @rows.length.times do |i| 
     condition1.push(@rows[i][i])
     condition2.push(@rows[i][2 - i])
    end
    if condition1.all?('O') || condition2.all?('O') 
      true 
    elsif condition1.all?('X') || condition2.all?('X') 
      true
    else
      false
    end
  end

  def draw?()
    if @available_cells <= 5
      (rows_match? == false) && (columns_match? == false) && (diagonals_match? == false) && @available_cells.zero? ? true : false
    else
      false
    end
  end

  def win?
    if @available_cells <= 5
      (rows_match? == true) || (columns_match? == true) || (diagonals_match? == true) ? true : false
    else
      false
    end
  end
end

class Player
  attr_accessor :player_movement, :name

  def initialize(name = '', current_winner = false, player_movement = '')
    @name = name
    @current_winner = current_winner
    @player_movement = player_movement
  end

  def sanitize_choice(choice)
    (choice.is_a? Integer) && (choice >= 1) && (choice <= 9) ? true : false
  end
end
