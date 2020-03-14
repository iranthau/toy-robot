class RobotRunnerError < StandardError; end

class RobotRunner
  def initialize(board, robot)
    raise RobotRunnerError, 'board and robot are required' if board.nil? || robot.nil?

    @board = board
    @robot = robot
  end

  def run(command)
    command = command.split

    case command.first
    when 'PLACE'
      ToyRobot::PlaceCommand.new(board, robot, ToyRobot::Position.new(*command.last.split(',')))
    when 'MOVE'
      ToyRobot::MoveCommand.new(board, robot)
    when 'LEFT'
      ToyRobot::LeftCommand.new(robot)
    when 'RIGHT'
      ToyRobot::RightCommand.new(robot)
    when 'REPORT'
      ToyRobot::ReportCommand.new(robot)
    end
  end

  private

  attr_reader :board, :robot
end
