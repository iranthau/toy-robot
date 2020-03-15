RSpec.describe ToyRobot::Robot do
  subject(:robot) { described_class.new }

  let(:position) { ToyRobot::Position.new(1, 2, 'NORTH') }

  describe '#report' do
    subject(:report) { robot.report }

    context 'when robot is NOT placed yet' do
      it 'raises an error' do
        expect { report }.to raise_error(ToyRobot::RobotError, 'place the robot first')
      end
    end

    context 'when the robot is placed' do
      it 'reports the current orientaions' do
        robot.place(position)

        expect(robot.report).to eq('1, 2, NORTH')
      end
    end
  end

  describe '#place' do
    subject(:place) { robot.place(position) }

    context 'when the params are NOT given' do
      let(:position) { nil }

      it 'raises an error' do
        expect { place }.to raise_error(ToyRobot::RobotError, 'valid cordinations are required')
      end
    end

    context 'when the params are given' do
      it 'places the robot at x, y locations facing given direction' do
        place

        expect(robot.report).to eq('1, 2, NORTH')
      end
    end
  end

  describe '#move' do
    subject(:move) { robot.move }

    context 'when the robot is NOT placed yet' do
      it 'raises an error' do
        expect { move }.to raise_error(ToyRobot::RobotError, 'place the robot first')
      end
    end

    context 'when the robot is placed' do
      it 'moves the robot towards the current direction by 1' do
        robot.place(position)
        move

        expect(robot.report).to eq('1, 3, NORTH')
      end
    end
  end

  describe '#turn_left' do
    subject(:turn_left) { robot.turn_left }

    context 'when the robot is NOT placed yet' do
      it 'raises an error' do
        expect { turn_left }.to raise_error(ToyRobot::RobotError, 'place the robot first')
      end
    end

    context 'when the robot is placed' do
      it 'turns the robot to right' do
        robot.place(position)
        turn_left

        expect(robot.report).to eq('1, 2, WEST')
      end
    end
  end

  describe '#turn_right' do
    subject(:turn_right) { robot.turn_right }

    context 'when the robot is NOT placed yet' do
      it 'raises an error' do
        expect { turn_right }.to raise_error(ToyRobot::RobotError, 'place the robot first')
      end
    end

    context 'when the robot is placed' do
      it 'turns the robot to left' do
        robot.place(position)
        turn_right

        expect(robot.report).to eq('1, 2, EAST')
      end
    end
  end

  describe '#try_move' do
    subject(:try_move) { robot.try_move }

    context 'when the robot is NOT placed yet' do
      it 'raises an error' do
        expect { try_move }.to raise_error(ToyRobot::RobotError, 'place the robot first')
      end
    end

    context 'when the robot is placed' do
      it 'returns the cordinations of the new position to be moved' do
        robot.place(position)
        try_move

        expect(try_move.x).to eq(1)
        expect(try_move.y).to eq(3)
        expect(try_move.direction).to eq('NORTH')
      end
    end
  end
end
