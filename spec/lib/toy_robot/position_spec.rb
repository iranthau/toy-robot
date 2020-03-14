RSpec.describe ToyRobot::Position do
  subject(:position) { described_class.new(x, y, direction) }

  let(:x) { 0 }
  let(:y) { 0 }
  let(:direction) { 'NORTH' }

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

  describe '#go' do
    subject(:go) { position.go }

    context 'when robot facing north' do
      it 'moves north' do
        go

        expect(go.x).to eq(0)
        expect(go.y).to eq(1)
        expect(go.direction).to eq('NORTH')
      end
    end

    context 'when robot facing east' do
      let(:direction) { 'EAST' }

      it 'moves east' do
        go

        expect(go.x).to eq(1)
        expect(go.y).to eq(0)
        expect(go.direction).to eq('EAST')
      end
    end

    context 'when robot facing south' do
      let(:direction) { 'SOUTH' }

      it 'moves south' do
        go

        expect(go.x).to eq(0)
        expect(go.y).to eq(-1)
        expect(go.direction).to eq('SOUTH')
      end
    end

    context 'when robot facing west' do
      let(:direction) { 'WEST' }

      it 'moves west' do
        go

        expect(go.x).to eq(-1)
        expect(go.y).to eq(0)
        expect(go.direction).to eq('WEST')
      end
    end
  end

  describe '#turn' do
    subject(:turn) { position.turn(orientation) }

    let(:orientation) { 'LEFT' }

    context 'when robot facing NORTH' do
      context 'when orientation is LEFT' do
        it 'turns left' do
          turn

          expect(turn.x).to eq(0)
          expect(turn.y).to eq(0)
          expect(turn.direction).to eq('WEST')
        end
      end

      context 'when orientation is RIGHT' do
        let(:orientation) { 'RIGHT' }

        it 'turns right' do
          turn

          expect(turn.x).to eq(0)
          expect(turn.y).to eq(0)
          expect(turn.direction).to eq('EAST')
        end
      end
    end
  end

  describe '#to_s' do
    subject(:to_s) { position.to_s }

    it 'turns left' do
      expect(to_s).to eq('0, 0, NORTH')
    end
  end
end
