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
        expect(board.valid_cell?(2)).to eql('_')
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

  describe '#columns_match?' do
    it 'It returns true if one of the columns have the same token' do
      expect do
        board.update('1', 'O')
        board.update('4', 'O')
        board.update('7', 'O')
        expect(board.column_match?).be_true
      end
    end

    it 'It returns true if one of the columns have the same token' do
      expect do
        board.update('2', 'X')
        board.update('5', 'O')
        board.update('8', 'O')
        expect(board.column_match?).be_false
      end
    end

    it 'It returns true if one of the columns have the same token' do
      expect do
        board.update('3', 'X')
        board.update('6', 'X')
        board.update('9', 'X')
        expect(board.column_match?).be_true
      end
    end
  end

  describe '#diagonals_match?' do
    it 'It returns true if one of the diagonals have the same token' do
      expect do
        board.update('1', 'X')
        board.update('5', 'X')
        board.update('9', 'X')
        expect(board.diagonal_match?).be_true
      end
    end

    it 'It returns true if one of the diagonals have the same token' do
      expect do
        board.update('3', 'X')
        board.update('5', 'X')
        board.update('7', 'X')
        expect(board.diagonal_match?).be_true
      end
    end
  end

  describe '#draw?' do
    it 'It returns true if there are no available moves and win moves' do
      expect do
        board.update('1', 'X')
        board.update('2', 'O')
        board.update('3', 'O')
        board.update('4', 'O')
        board.update('5', 'X')
        board.update('6', 'X')
        board.update('7', 'X')
        board.update('8', 'X')
        board.update('9', 'O')
        expect(board.draw?).be_true
      end
    end

    it 'It returns false when the game starts' do
      expect do
        expect(board.draw?).be_false
      end
    end
  end

  describe '#win?' do
    it 'It returns false when the game starts' do
      expect do
        expect(board.win?).be_false
      end
    end

    it 'It returns true if there is a token match vertically, horizontally or diagonally' do
      expect do
        board.update('1', 'O')
        board.update('2', 'O')
        board.update('3', 'O')
        expect(board.win?).be_true
      end
    end

    it 'It returns true if there is a token match vertically, horizontally or diagonally' do
      expect do
        board.update('1', 'X')
        board.update('5', 'X')
        board.update('9', 'X')
        expect(board.win?).be_true
      end
    end
  end
end

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
