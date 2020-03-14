module ToyRobot
  class CommandError < StandardError; end

  class RightCommand
    def initialize(robot)
      raise ToyRobot::CommandError, 'robot is required' if robot.nil?

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