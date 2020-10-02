require_relative '../lib/game_logic'

describe Board do
  let(:board) { Board.new }

  describe '#update' do
    it 'When choice is 1 and token X' do
      expect do
        board.update('1', 'X')
        expect(board.update[0][0]).to eql('X')
      end
    end

    it 'When choice is 9 and token O' do
      expect do
        board.update('9', 'O')
        expect(board.update[2][2]).to eql('O')
      end
    end

    it 'When choice is 2 and token X' do
      expect do
        board.update('2', 'X')
        expect(board.update[0][1]).not_to eql('O')
      end
    end
  end

  describe '#valid_cell?' do
    it 'It returns true when a cell is "_"' do
      expect do
        expect(board.valid_cell?(2)).to eql("_")
      end
    end

    it 'It returns true when a cell is "_"' do
      expect do
        board.update('5', 'X')
        expect(board.valid_cell?(5)).be_false
      end
    end
  end

  describe '#rows_match?' do
    it 'It returns false at the beginning if the game' do
      expect do
        expect(board.rows_match?).be_false
      end
    end

    it 'It returns true if one of the rows have the same token' do
      expect do
        board.update('1', 'X')
        board.update('2', 'X')
        board.update('3', 'X')
        expect(board.rows_match?).be_true
      end
    end

    it 'It returns true if one of the rows have the same token' do
      expect do
        board.update('7', 'O')
        board.update('8', 'O')
        board.update('9', 'O')
        expect(board.rows_match?).be_true
      end
    end

    it 'It returns false if one of the token in a row is different' do
      expect do
        board.update('1', 'X')
        board.update('2', 'O')
        board.update('3', 'X')
        expect(board.rows_match?).be_false
      end
    end
  end

  
end
