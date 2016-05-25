# Robot
class Robot
  DIRECTION = %w(N E S W).freeze

  attr_reader :position
  attr_accessor :board

  def place(x, y, direction)
    @position = Position.new(x, y)
    @direction = DIRECTION.index(direction)
  end

  def move
    raise 'illegal move' unless @board.position_valid?(next_move)
    case direction
    when 'N'
      @position.move_north
    when 'E'
      @position.move_east
    when 'S'
      @position.move_south
    when 'W'
      @position.move_west
    end
  end

  def left
    @direction -= 1
  end

  def right
    @direction += 1
  end

  def report
    "#{@position.x}, #{@position.y}, #{direction}"
  end

  private

  def next_move
    position = Position.new(@position.x, @position.y)
    case direction
    when 'N'
      position.move_north
    when 'E'
      position.move_east
    when 'S'
      position.move_south
    when 'W'
      position.move_west
    end
    position
  end

  def direction
    DIRECTION[@direction % 4]
  end
end
