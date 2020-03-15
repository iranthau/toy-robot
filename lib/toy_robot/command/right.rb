module ToyRobot
  module Command
    class Right
      def initialize(robot)
        raise ToyRobot::Command::CommandError, 'robot is required' if robot.nil?

        @robot = robot
      end

      def run
        robot.turn_right
        robot.report
      end

      private

      attr_reader :robot
    end
  end
end