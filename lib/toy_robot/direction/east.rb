require 'toy_robot/direction/direction'

# East
class East < Direction
  def move(position)
    x = position.x + 1
    Position.new(x, position.y)
  end
end
