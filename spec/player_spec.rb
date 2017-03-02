require 'player'

describe Player do

  subject(:jack) {described_class.new('Jack')}
  subject(:daniel) {described_class.new('Daniel')}

  describe '#name' do
    it 'stores the player name' do
      player = Player.new('Vicky')
      expect(player.name).to eq 'Vicky'
    end
  end

  describe '#hit_points' do
    it 'reduces score' do
      player = Player.new('Vicky')
      expect(player.hit_points).to eq described_class::DEFAULT_HP
    end
  end

  describe '#attack' do
    it 'attacks the opponent' do
      expect(daniel).to receive(:receive_hit)
      jack.attack(daniel)
    end
  end

  describe '#receive_hit' do
    it 'decreases hit points' do
      expect { daniel.receive_hit }.to change { daniel.hit_points }.by(-10)
    end
  end


end
