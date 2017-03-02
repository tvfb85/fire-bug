require 'game'

describe Game do
  subject(:game) { described_class.new }
  # let(:player_1) { double :player }
  # let(:player_2) { double :player }

  describe '#attack' do
    it 'attacks the opponent' do
      player1 = Player.new('Vicky')
      player2 = Player.new('Tim')
      expect(player2).to receive(:receive_hit)
      game.attack(player2)
    end
  end
  
end
