module ToyRobot
  class RobotError < StandardError; end

  class Robot
    attr_reader :position

    def move
      raise RobotError, 'place the robot first' if position.nil?

      @position = position.go
    end

    def place(new_position)
      raise RobotError, 'valid cordinations are required' if new_position.nil?

      @position = new_position
    end

    def report
      return 'robot is not placed yet' if position.nil?

      position.to_s
    end

    def turn_left
      raise RobotError, 'place the robot first' if position.nil?

      @position = position.turn('LEFT')
    end

    def turn_right
      raise RobotError, 'place the robot first' if position.nil?

      @position = position.turn('RIGHT')
    end

    def try_move
      raise RobotError, 'place the robot first' if position.nil?

      ToyRobot::Position.new(position.x, position.y, position.direction).go
    end
  end
end
