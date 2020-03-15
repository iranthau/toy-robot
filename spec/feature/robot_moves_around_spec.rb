RSpec.describe 'Robot moves around' do
  subject(:robot_runner) { RobotRunner.new(board, robot) }

  let(:board) { ToyRobot::Board.new }
  let(:robot) { ToyRobot::Robot.new }

  describe 'Robot moves north and report' do
    it do
      command = robot_runner.run('PLACE 0,0,NORTH')
      command.run
      command = robot_runner.run('MOVE')
      command.run

      expect(robot.report).to eq('0, 1, NORTH')
    end
  end

  describe 'Robot turns left and report' do
    it do
      command = robot_runner.run('PLACE 0,0,NORTH')
      command.run
      command = robot_runner.run('LEFT')
      command.run

      expect(robot.report).to eq('0, 0, WEST')
    end
  end

  describe 'Robot moves east, turns left, move, and report' do
    it do
      command = robot_runner.run('PLACE 1,2,EAST')
      command.run
      command = robot_runner.run('MOVE')
      command.run
      command = robot_runner.run('MOVE')
      command.run
      command = robot_runner.run('LEFT')
      command.run
      command = robot_runner.run('MOVE')
      command.run

      expect(robot.report).to eq('3, 3, NORTH')
    end
  end

  describe 'Process a large data set' do
    it do
      command = robot_runner.run('PLACE 0,0,NORTH')
      command.run

      100_000.times do
        4.times do
          command = robot_runner.run('MOVE')
          command.run
        end

        command = robot_runner.run('RIGHT')
        command.run
      end

      command = robot_runner.run('MOVE')
      command.run
      command = robot_runner.run('RIGHT')
      command.run

      expect(robot.report).to eq('0, 1, EAST')
    end
  end

  describe 'invalid input' do
    subject(:invalid_command) { robot_runner.run('PLACE 0,0') }

    it do
      expect { invalid_command }.to raise_error ToyRobot::Command::CommandError, 'invalid command'
    end
  end
end