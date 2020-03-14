module ToyRobot
  class PositionError < StandardError; end

  class Position
    DIRECTION = %w[NORTH EAST SOUTH WEST].freeze

    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      raise PositionError, 'valid cordinations are required' unless position_valid?(x, y, direction)

      @x = x.to_i
      @y = y.to_i
      @direction = direction
    end

    def go
      case direction
      when 'NORTH'
        to_north
      when 'EAST'
        to_east
      when 'SOUTH'
        to_south
      when 'WEST'
        to_west
      end

      ToyRobot::Position.new(x, y, direction)
    end

    def turn(orientation)
      case orientation
      when 'LEFT'
        to_left
      when 'RIGHT'
        to_right
      end

      ToyRobot::Position.new(x, y, direction)
    end

    def to_s
      "#{x}, #{y}, #{direction}"
    end

    private

    def position_valid?(x, y, direction)
      !x.nil? && !y.nil? && DIRECTION.include?(direction)
    end

    def to_north
      @y += 1
    end

    def to_east
      @x += 1
    end

    def to_south
      @y -= 1
    end

    def to_west
      @x -= 1
    end

    def to_right
      @direction = DIRECTION[(DIRECTION.index(direction) + 1) % DIRECTION.count]
    end

    def to_left
      @direction = DIRECTION[(DIRECTION.index(direction) - 1) % DIRECTION.count]
    end
  end
end