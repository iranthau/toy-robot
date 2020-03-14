RSpec.describe RobotRunner do
  subject(:application) { described_class.new(board, robot) }

  let(:board) { instance_double(ToyRobot::Board) }
  let(:robot) { instance_double(ToyRobot::Robot) }

  describe '.new' do
    context 'when the params are empty' do
      let(:board) { nil }
      let(:robot) { nil }

      it 'raises an error' do
        expect { application }.to raise_error(RobotRunnerError, 'board and robot are required')
      end
    end

    context 'when required params are given' do
      it 'does NOT rais an error' do
        expect { application }.not_to raise_error
      end
    end
  end

  describe '#run' do
    subject(:run) { application.run(command) }

    let(:command) { 'PLACE 1,2,NORTH' }

    context 'when user enters PLACE command' do
      let(:place_command_mock) { instance_double(ToyRobot::PlaceCommand) }
      let(:position_mock) { instance_double(ToyRobot::Position) }

      before do
        allow(ToyRobot::PlaceCommand).to receive(:new) { place_command_mock }
        allow(ToyRobot::Position).to receive(:new) { position_mock }
      end

      it 'executes place command' do
        run

        expect(ToyRobot::PlaceCommand).to have_received(:new).with(board, robot, position_mock)
      end
    end

    context 'when user enters MOVE command' do
      let(:command) { 'MOVE' }
      let(:move_command_mock) { instance_double(ToyRobot::MoveCommand) }

      before do
        allow(ToyRobot::MoveCommand).to receive(:new) { move_command_mock }
      end

      it 'executes move command' do
        run

        expect(ToyRobot::MoveCommand).to have_received(:new).with(board, robot)
      end
    end

    context 'when user enters LEFT command' do
      let(:command) { 'LEFT' }
      let(:left_command_mock) { instance_double(ToyRobot::LeftCommand) }

      before do
        allow(ToyRobot::LeftCommand).to receive(:new) { left_command_mock }
      end

      it 'executes left command' do
        run

        expect(ToyRobot::LeftCommand).to have_received(:new).with(robot)
      end
    end

    context 'when user enters RIGHT command' do
      let(:command) { 'RIGHT' }
      let(:right_command_mock) { instance_double(ToyRobot::RightCommand) }

      before do
        allow(ToyRobot::RightCommand).to receive(:new) { right_command_mock }
      end

      it 'executes right command' do
        run

        expect(ToyRobot::RightCommand).to have_received(:new).with(robot)
      end
    end

    context 'when user enters REPORT command' do
      let(:command) { 'REPORT' }
      let(:report_command_mock) { instance_double(ToyRobot::ReportCommand) }

      before do
        allow(ToyRobot::ReportCommand).to receive(:new) { report_command_mock }
      end

      it 'executes report command' do
        run

        expect(ToyRobot::ReportCommand).to have_received(:new).with(robot)
      end
    end
  end
end