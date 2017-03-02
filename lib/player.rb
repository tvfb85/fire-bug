class Player

  DEFAULT_HP = 60
  attr_reader :name, :hit_points

  def initialize(name, hit_points = DEFAULT_HP)
    @name = name
    @hit_points = hit_points
  end

  def attack(player)
    player.receive_hit
  end

  def receive_hit
    @hit_points -= 10
  end

end
