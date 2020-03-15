module ToyRobot
  module Command
    class CommandError < StandardError; end

    class Left
      def initialize(robot)
        raise ToyRobot::Command::CommandError, 'robot is required' if robot.nil?

        @robot = robot
      end

      def run
        robot.turn_left
        robot.report
      end

      private

      attr_reader :robot
    end
  end
end