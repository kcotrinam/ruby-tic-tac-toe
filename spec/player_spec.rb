require_relative '../lib/player'

describe Player do
  let(:player) { Player.new("#{name}.to_s") }
  describe '#sanitize_choice' do
    it 'Should return the instance of player' do
      expect do
        new_player = Player.new('Mark')
        expect(new_player.name).to eql('Mark')
      end
    end

    it 'It returns false if the choice length is different of 1' do
      expect do
        expect(player.sanitize_choice('12')).be_false
      end
    end

    it 'It returns false if choice is not between 1 and 9' do
      expect do
        expect(player.sanitize_choice('11')).be_false
      end
    end

    it 'It returns true if choice is between 1 and 9' do
      expect do
        expect(player.sanitize_choice('4')).be_true
      end
    end
  end
end
