module ToyRobot
  class CommandError < StandardError; end

  class PlaceCommand
    def initialize(board, robot, position)
      raise ToyRobot::CommandError, 'valid params are required' if [board, robot, position].compact.count != 3

      @board = board
      @robot = robot
      @position = position
    end

    def run
      raise ToyRobot::PositionError, 'position is invalid' unless board.position_valid?(position)

      robot.place(position)
      robot.report
    end

    private

    attr_reader :board, :robot, :position
  end
end