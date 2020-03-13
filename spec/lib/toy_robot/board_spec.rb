RSpec.describe ToyRobot::Board do
  subject(:board) { described_class.instance }

  describe '.instance' do
    it 'raises an error' do
      expect{ ToyRobot::Board.new }.to raise_error(NoMethodError)
    end

    it { expect(board).to eq ToyRobot::Board.instance }
  end

  describe '#add_item' do
    subject(:add_item) { board.add_item(item) }

    let(:item) { instance_double(ToyRobot::Robot) }

    context 'when an item is NOT given' do
      let(:item) { nil }

      it 'raises an error' do
        expect{ add_item }.to raise_error(ToyRobot::BoardError, 'an item is required')
        expect(board.items).to eq []
      end
    end

    context 'when an item is given' do
      it 'add the item to the items array' do
        expect{ add_item }.not_to raise_error
        expect(board.items.count).to eq 1
      end
    end
  end

  describe '#get_item' do
    subject(:get_item) { board.get_item(name) }

    let(:item) { instance_double(ToyRobot::Robot, name: 'Jarbas') }

    context 'when a name is NOT given' do
      let(:name) { nil }

      it 'raises an error' do
        expect{ get_item }.to raise_error(ToyRobot::BoardError, 'a name is required')
      end
    end

    context 'when a name is given' do
      before do
        allow(board).to receive(:items) { [item] }
      end

      context 'and an item with the name does NOT exist' do
        let(:name) { 'Koala' }

        it { is_expected.to eq nil }
      end

      context 'and an item with the name exists' do
        let(:name) { 'Jarbas' }

        it { is_expected.to eq item }
      end
    end
  end

  describe '#position_valid?' do
    subject(:position_valid?) { board.position_valid?(position) }

    let(:position) { nil }

    context 'when the position is NOT given' do
      it 'raises an error' do
        expect{ position_valid? }.to raise_error(ToyRobot::BoardError, 'a valid position required')
      end
    end

    context 'when the position is given' do
      context 'when the position is invalid' do
        let(:position) { instance_double(Position, x: 10, y: 10) }

        it { is_expected.to eq false }
      end

      context 'when the position is valid' do
        let(:position) { instance_double(Position, x: 0, y: 0) }

        it { is_expected.to eq true }
      end
    end
  end
end
