# Robot
class Robot
  attr_reader :x, :y, :direction

  def initialize
    @x = 0
    @y = 0
    @direction = 'N'
  end

  def place(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
    case direction
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    end
  end

  def left
    case direction
    when 'N'
      @direction = 'W'
    when 'E'
      @direction = 'N'
    when 'S'
      @direction = 'E'
    when 'W'
      @direction = 'S'
    end
  end

  def right
    case direction
    when 'N'
      @direction = 'E'
    when 'E'
      @direction = 'S'
    when 'S'
      @direction = 'W'
    when 'W'
      @direction = 'N'
    end
  end

  def report
    "#{x}, #{y}, #{direction}"
  end
end
