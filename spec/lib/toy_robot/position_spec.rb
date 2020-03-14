RSpec.describe ToyRobot::Position do
  subject(:position) { described_class.new(x, y, direction) }

  let(:x) { 0 }
  let(:y) { 0 }
  let(:direction) { 'N' }

  describe '.new' do
    context 'when the cordinations are NOT given' do
      let(:x) { nil }
      let(:y) { nil }
      let(:direction) { nil }

      it 'raises an error' do
        expect { position }.to raise_error(ToyRobot::PositionError, 'valid cordinations are required')
      end
    end

    context 'when the cordinations are given' do
      it 'sets x, y and direction ' do
        expect(position.x).to eq 0
        expect(position.y).to eq 0
        expect(position.direction).to eq 'NORTH'
      end
    end
  end

  describe '#to_north' do
    subject(:to_north) { position.to_north }

    it 'moves north by 1 step' do
      to_north

      expect(position.x).to eq(0)
      expect(position.y).to eq(1)
      expect(position.direction).to eq('NORTH')
    end
  end

  describe '#to_east' do
    subject(:to_east) { position.to_east }

    it 'moves east by 1 step' do
      to_east

      expect(position.x).to eq(1)
      expect(position.y).to eq(0)
      expect(position.direction).to eq('NORTH')
    end
  end

  describe '#to_south' do
    subject(:to_south) { position.to_south }

    it 'moves south by 1 step' do
      to_south

      expect(position.x).to eq(0)
      expect(position.y).to eq(-1)
      expect(position.direction).to eq('NORTH')
    end
  end

  describe '#to_west' do
    subject(:to_west) { position.to_west }

    it 'moves west by 1 step' do
      to_west

      expect(position.x).to eq(-1)
      expect(position.y).to eq(0)
      expect(position.direction).to eq('NORTH')
    end
  end

  describe '#to_right' do
    subject(:to_right) { position.to_right }

    it 'turns right' do
      to_right

      expect(position.x).to eq(0)
      expect(position.y).to eq(0)
      expect(position.direction).to eq('EAST')
    end
  end

  describe '#to_left' do
    subject(:to_left) { position.to_left }

    it 'turns left' do
      to_left

      expect(position.x).to eq(0)
      expect(position.y).to eq(0)
      expect(position.direction).to eq('WEST')
    end
  end
end
