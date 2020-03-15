module ToyRobot
  module Command
    class Report
      def initialize(robot)
        raise ToyRobot::Command::CommandError, 'robot is required' if robot.nil?

        @robot = robot
      end

      def run
        robot.report
      end

      private

      attr_reader :robot
    end
  end
end