module ToyRobot
  class PositionError < StandardError; end

  class Position
    DIRECTION = {
      'N' => 'NORTH',
      'E' => 'EAST',
      'S' => 'SOUTH',
      'W' => 'WEST'
    }.freeze

    attr_reader :x, :y, :direction

    def initialize(x, y, direction)
      raise PositionError, 'valid cordinations are required' unless position_valid?(x, y, direction)

      @x = x.to_i
      @y = y.to_i
      @direction = DIRECTION[direction]
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
      @direction = DIRECTION.values[(DIRECTION.values.index(direction) + 1) % DIRECTION.keys.count]
    end

    def to_left
      @direction = DIRECTION.values[(DIRECTION.values.index(direction) - 1) % DIRECTION.keys.count]
    end

    private

    def position_valid?(x, y, direction)
      !x.nil? && !y.nil? && DIRECTION.has_key?(direction)
    end
  end
end