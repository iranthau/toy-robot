module ToyRobot
  class CommandError < StandardError; end

  class LeftCommand
    def initialize(robot)
      raise ToyRobot::CommandError, 'robot is required' if robot.nil?

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