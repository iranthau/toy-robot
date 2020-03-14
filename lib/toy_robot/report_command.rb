module ToyRobot
  class CommandError < StandardError; end

  class ReportCommand
    def initialize(robot)
      raise ToyRobot::CommandError, 'robot is required' if robot.nil?

      @robot = robot
    end

    def run
      robot.report
    end

    private

    attr_reader :robot
  end
end