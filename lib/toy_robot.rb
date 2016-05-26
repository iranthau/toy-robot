require 'toy_robot/board'

# ToyRobot
class ToyRobot
  def self.start
    board = init_game
    robot = board.robot

    while command = gets.chomp.upcase
      case command
      when 'PLACE'
        puts 'Invalid position' unless place_robot(board)
      when 'MOVE'
        puts 'Invalid move' unless move_robot(board)
      when 'LEFT'
        robot.left
      when 'RIGHT'
        robot.right
      when 'REPORT'
        puts robot.report
      when 'EXIT'
        puts 'Exiting.......'
        return
      else
        puts 'Invalid command'
      end
      print_moves
    end
  end

  def self.init_game
    puts '--------- Toy Robot ---------'
    print_moves
    Board.new
  end

  def self.place_robot(board)
    puts 'Position: '
    x, y = gets.chomp.split(' ')
    puts 'Direction: '
    direction = gets.chomp
    position = Position.new(x, y)
    if board.position_valid?(position)
      board.robot.place(x, y, direction)
      return true
    end
    false
  end

  def self.move_robot(board)
    if board.position_valid?(board.robot.try_move)
      board.robot.move
      return true
    end
    false
  end

  def self.print_moves
    puts 'Accepted commnands: PLACE, MOVE, LEFT, RIGHT, REPORT'
  end
end
