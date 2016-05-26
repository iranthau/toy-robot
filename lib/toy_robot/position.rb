# Position
class Position
  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    @x = x.to_i
    @y = y.to_i
  end

  def move_north
    @y += 1
  end

  def move_east
    @x += 1
  end

  def move_south
    @y -= 1
  end

  def move_west
    @x -= 1
  end
end
