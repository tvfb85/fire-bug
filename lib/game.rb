class Game

  attr_reader :player_one, :player_two, :current_turn, :opponent, :winner

  def self.create(player_one, player_two)
    @game = Game.new(player_one, player_two)
  end

  def self.instance
    @game
  end

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
    check_game_status
  end

  def check_game_status
    game_over? ? assign_winner : switch_turns
  end

  def assign_winner
      @current_turn == 0 ? @winner = @current_turn : @winner = @opponent
  end

  def switch_turns
      @opponent = @current_turn
      @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_current_player)
    @players.select { |player| player != the_current_player}.first
  end

  def game_over?
    (@current_turn.hit_points == 0 || @opponent.hit_points == 0)
  end

end
