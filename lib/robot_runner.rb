class RobotRunnerError < StandardError; end

class RobotRunner
  def initialize(board, robot)
    raise RobotRunnerError, 'board and robot are required' if board.nil? || robot.nil?

    @board = board
    @robot = robot
  end

  def run(input)
    args = input.split
    command = args.shift

    case command
    when 'PLACE'
      ToyRobot::Command::Place.new(board, robot, position(args.join.split(',')))
    when 'MOVE'
      ToyRobot::Command::Move.new(board, robot)
    when 'LEFT'
      ToyRobot::Command::Left.new(robot)
    when 'RIGHT'
      ToyRobot::Command::Right.new(robot)
    when 'REPORT'
      ToyRobot::Command::Report.new(robot)
    else
      raise ToyRobot::Command::CommandError, 'invalid command'
    end
  end

  private

  attr_reader :board, :robot

  def position(args)
    raise ToyRobot::Command::CommandError, 'invalid command' if args.count != 3

    ToyRobot::Position.new(*args.map(&:strip))
  end
end
