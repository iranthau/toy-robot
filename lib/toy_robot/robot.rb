require 'toy_robot/position'
require 'toy_robot/direction/north'
require 'toy_robot/direction/east'
require 'toy_robot/direction/south'
require 'toy_robot/direction/west'

# Robot
class Robot
  DIRECTION = {
    'N' => North.new,
    'E' => East.new,
    'S' => South.new,
    'W' => West.new
  }.freeze

  attr_reader :position, :name

  def initialize(name)
    @name = name
    @position = Position.new
    @direction = DIRECTION['N']
    @directions = DIRECTION.values
  end

  def place(x, y, direction)
    @position = Position.new(x.to_i, y.to_i)
    @direction = DIRECTION[direction]
  end

  def move
    @position = @direction.move(@position)
  end

  def left
    direction_index = @directions.index(@direction)
    @direction = @directions[direction_index - 1]
  end

  def right
    direction_index = @directions.index(@direction)
    @direction = @directions[direction_index + 1]
  end

  def try_move
    position = Position.new(@position.x, @position.y)
    @direction.move(position)
  end

  def report
    "#{@position.x}, #{@position.y}, #{direction}"
  end

  private

  def direction
    DIRECTION.key(@direction)
  end
end
