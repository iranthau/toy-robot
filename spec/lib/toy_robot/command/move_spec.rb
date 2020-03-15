RSpec.describe ToyRobot::Command::Move do
  subject(:move_command) { described_class.new(board, robot) }

  let(:board) { nil }
  let(:robot) { nil }

  describe '.new' do
    context 'when params are missing' do
      it 'raises an error' do
        expect{ move_command }.to raise_error(ToyRobot::Command::CommandError, 'valid params are required')
      end
    end

    context 'when the params are given' do
      let(:board) { instance_double(ToyRobot::Board) }
      let(:robot) { instance_double(ToyRobot::Robot) }

      it 'does NOT rais an error' do
        expect{ move_command }.not_to raise_error
      end
    end
  end

  describe '#run' do
    subject(:run) { move_command.run }

    let(:board) { instance_double(ToyRobot::Board, position_valid?: position_valid) }
    let(:robot) { instance_double(ToyRobot::Robot, move: true, try_move: position, report: true) }
    let(:position) { instance_double(ToyRobot::Position) }

    context 'when the new position is invalid' do
      let(:position_valid) { false }

      it 'raises an error' do
        expect{ run }.to raise_error(ToyRobot::PositionError, 'position is invalid')
      end
    end

    context 'when the new position is valid' do
      let(:position_valid) { true }

      it 'places the robot' do
        run

        expect(robot).to have_received(:try_move)
        expect(board).to have_received(:position_valid?).with(position)
        expect(robot).to have_received(:move)
        expect(robot).to have_received(:report)
      end
    end
  end
end