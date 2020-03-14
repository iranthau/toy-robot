RSpec.describe ToyRobot::Board do
  subject(:board) { described_class.new }

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
        let(:position) { instance_double(ToyRobot::Position, x: 10, y: 10) }

        it { is_expected.to eq false }
      end

      context 'when the position is valid' do
        let(:position) { instance_double(ToyRobot::Position, x: 0, y: 0) }

        it { is_expected.to eq true }
      end
    end
  end
end
