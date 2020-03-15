RSpec.describe ToyRobot::Command::Place do
  subject(:place_command) { described_class.new(board, robot, position) }

  let(:board) { nil }
  let(:robot) { nil }
  let(:position) { nil }

  describe '.new' do
    context 'when params are missing' do
      it 'raises an error' do
        expect{ place_command }.to raise_error(ToyRobot::Command::CommandError, 'valid params are required')
      end
    end

    context 'when the params are given' do
      let(:board) { instance_double(ToyRobot::Board) }
      let(:robot) { instance_double(ToyRobot::Robot) }
      let(:position) { instance_double(ToyRobot::Position) }

      it 'does NOT rais an error' do
        expect{ place_command }.not_to raise_error
      end
    end
  end

  describe '#run' do
    subject(:run) { place_command.run }

    let(:board) { instance_double(ToyRobot::Board, position_valid?: position_valid) }
    let(:robot) { instance_double(ToyRobot::Robot, place: true, report: true) }
    let(:position) { instance_double(ToyRobot::Position) }

    context 'when the position is invalid' do
      let(:position_valid) { false }

      it 'raises an error' do
        expect{ run }.to raise_error(ToyRobot::PositionError, 'position is invalid')
      end
    end

    context 'when the position is valid' do
      let(:position_valid) { true }

      it 'places the robot' do
        run

        expect(board).to have_received(:position_valid?).with(position)
        expect(robot).to have_received(:place).with(position)
        expect(robot).to have_received(:report)
      end
    end
  end
end