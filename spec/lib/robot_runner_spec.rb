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

    context 'when the user enters an invalid command' do
      let(:command) { 'invalid_command' }

      it 'raises an error' do
        expect { run }.to raise_error(ToyRobot::Command::CommandError, 'invalid command')
      end
    end

    context 'when user enters PLACE command' do
      let(:position_mock) { instance_double(ToyRobot::Position) }

      before do
        allow(ToyRobot::Command::Place).to receive(:new)
        allow(ToyRobot::Position).to receive(:new) { position_mock }
      end

      context 'when the place command is invalid' do
        let(:command) { 'PLACE 1,2' }

        it 'raises an error' do
          expect { run }.to raise_error(ToyRobot::Command::CommandError, 'invalid command')
        end
      end

      context 'when the place command is valid' do
        it 'executes place command' do
          run

          expect(ToyRobot::Command::Place).to have_received(:new).with(board, robot, position_mock)
        end
      end
    end

    context 'when user enters MOVE command' do
      let(:command) { 'MOVE' }

      before do
        allow(ToyRobot::Command::Move).to receive(:new)
      end

      it 'executes move command' do
        run

        expect(ToyRobot::Command::Move).to have_received(:new).with(board, robot)
      end
    end

    context 'when user enters LEFT command' do
      let(:command) { 'LEFT' }

      before do
        allow(ToyRobot::Command::Left).to receive(:new)
      end

      it 'executes left command' do
        run

        expect(ToyRobot::Command::Left).to have_received(:new).with(robot)
      end
    end

    context 'when user enters RIGHT command' do
      let(:command) { 'RIGHT' }

      before do
        allow(ToyRobot::Command::Right).to receive(:new)
      end

      it 'executes right command' do
        run

        expect(ToyRobot::Command::Right).to have_received(:new).with(robot)
      end
    end

    context 'when user enters REPORT command' do
      let(:command) { 'REPORT' }

      before do
        allow(ToyRobot::Command::Report).to receive(:new)
      end

      it 'executes report command' do
        run

        expect(ToyRobot::Command::Report).to have_received(:new).with(robot)
      end
    end
  end
end