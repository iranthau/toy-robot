module ToyRobot
  class RobotError < StandardError; end

  class Robot
    attr_reader :position

    def move
      show_error if position.nil?

      @position = position.go
    end

    def place(new_position)
      show_error(message: 'valid cordinations are required') if new_position.nil?

      @position = new_position
    end

    def report
      show_error if position.nil?

      position.to_s
    end

    def turn_left
      show_error if position.nil?

      @position = position.turn('LEFT')
    end

    def turn_right
      show_error if position.nil?

      @position = position.turn('RIGHT')
    end

    def try_move
      show_error if position.nil?

      ToyRobot::Position.new(position.x, position.y, position.direction).go
    end

    private

    def show_error(message: 'place the robot first')
      raise ToyRobot::RobotError, message
    end
  end
end
