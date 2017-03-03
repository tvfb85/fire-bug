require 'game'

describe Game do
  subject(:game) { described_class.new(player_one, player_two) }
  let(:player_one) { Player.new('Mickey', hit_points = Player::DEFAULT_HP) }
  let(:player_two) { Player.new('Joe', hit_points = Player::DEFAULT_HP) }

  describe 'player one' do
    it 'instantiates the first player' do
      expect(game.player_one).to eq player_one
    end
  end

  describe 'player two' do
    it 'instantiates the second player' do
      expect(game.player_two).to eq player_two
    end
  end

  describe '#fire' do
    it 'fires the opponent' do
      expect(player_two).to receive(:receive_hit)
      game.fire(player_two)
    end
  end

  describe '#current_turn' do
    it 'player_one goes first' do
      expect(game.current_turn).to eq(player_one)
    end

    it 'player_two goes second' do
      game.switch_turns
      expect(game.current_turn).to eq(player_two)
    end
  end

  describe '#winning' do
    it 'hit points can reach zero' do
      4.times { game.grenade(player_two) }
      expect(player_two.hit_points).to eq 0
    end

    it 'a winner is returned', :focus => true do
      4.times { game.grenade(player_two) }
      expect(game.winner.name).to eq player_one.name
    end
  end

end
