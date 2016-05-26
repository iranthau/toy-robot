require 'toy_robot/direction/direction'

# North
class North < Direction
  def move(position)
    y = position.y + 1
    Position.new(position.x, y)
  end
end
