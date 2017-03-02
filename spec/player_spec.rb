require 'player'

describe Player do

  describe '#name' do
    it 'stores the player name' do
      player = Player.new('Vicky')
      expect(player.name).to eq 'Vicky'
    end
  end

end
