require 'toy_robot/direction/direction'

# South
class South < Direction
  def move(position)
    y = position.y - 1
    Position.new(position.x, y)
  end
end
