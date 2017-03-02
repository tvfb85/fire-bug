require 'game'

describe Game do
  subject(:game) { described_class.new(player_one, player_two) }
  let(:player_one) { double :player }
  let(:player_two) { double :player }

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

  describe '#attack' do
    it 'attacks the opponent' do
      expect(player_two).to receive(:receive_hit)
      game.attack(player_two)
    end
  end

end
