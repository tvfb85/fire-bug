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

  # def attack(player)
  #   player.receive_hit(10)
  #   check_game_status
  # end

  def fire(player)
    player.receive_hit(10)
    check_game_status
  end

  def pink_unicorn(player)
    player.receive_hit(7)
    check_game_status
  end

  def popcorn(player)
    player.receive_hit(12)
    check_game_status
  end

  def beer(player)
    player.receive_hit(5)
    check_game_status
  end

  def grenade(player)
    player.receive_hit(15)
    check_game_status
  end

  def check_game_status
    game_over? ? assign_winner : switch_turns
  end

  def assign_winner
      @current_turn.hit_points <= 0 ? @winner = @opponent : @winner = @current_turn
  end

  def switch_turns
      @opponent = @current_turn
      @current_turn = opponent_of(current_turn)
  end

  def opponent_of(the_current_player)
    @players.select { |player| player != the_current_player}.first
  end

  def game_over?
    (@current_turn.hit_points <= 0 || @opponent.hit_points <= 0)
  end

end
