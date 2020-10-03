class Player
  attr_accessor :player_movement, :name

  def initialize(name = '', current_winner = false, player_movement = '')
    @name = name
    @current_winner = current_winner
    @player_movement = player_movement
  end

  def sanitize_choice(choice)
    return false unless choice.length == 1

    choice = choice.to_i
    (choice != 0) && (choice >= 1) && (choice <= 9) ? true : false
  end
end
