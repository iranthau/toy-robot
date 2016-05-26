require 'toy_robot/robot'

# Board
class Board
  attr_reader :rows, :cols, :robot

  def initialize(rows = 5, cols = 5)
    @rows = rows
    @cols = cols
    @robot = Robot.new
  end

  def position_valid?(position)
    position.x.between?(0, @rows - 1) && position.y.between?(0, @cols - 1)
  end
end
