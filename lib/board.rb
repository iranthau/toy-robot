# Board
class Board
  attr_reader :robots

  def initialize(rows = 5, cols = 5)
    @position = Position.new(rows, cols)
    @robots = []
  end

  def add_robot(robot)
    raise 'invalid position' unless position_valid?(robot.position)
    robot.board = self
    @robots << robot
  end

  def position_valid?(position)
    position.x.between?(0, @position.x - 1) &&
      position.y.between?(0, @position.y - 1)
  end
end
