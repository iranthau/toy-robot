module ToyRobot
  module Command
    class Move
      def initialize(board, robot)
        raise ToyRobot::Command::CommandError, 'valid params are required' if board.nil? || robot.nil?

        @board = board
        @robot = robot
      end

      def run
        raise ToyRobot::PositionError, 'position is invalid' unless board.position_valid?(robot.try_move)

        robot.move
        robot.report
      end

      private

      attr_reader :board, :robot
    end
  end
end