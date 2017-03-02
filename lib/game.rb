class Game

  attr_reader :player_one, :player_two, :current_turn, :opponent

  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @current_turn = player_one
    @opponent = player_two
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def attack(player)
    player.receive_hit
  end

  def switch_turns
    @opponent = @current_turn
    @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_current_player)
    @players.select { |player| player != the_current_player}.first
  end

end
