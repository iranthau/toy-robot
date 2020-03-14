module ToyRobot
  class BoardError < StandardError; end

  class Board
    attr_reader :rows, :cols

    def initialize(rows: 5, cols: 5)
      @rows = rows
      @cols = cols
    end

    def position_valid?(position)
      raise BoardError, 'a valid position required' if position.nil?

      position.x.between?(0, rows - 1) && position.y.between?(0, cols - 1)
    end
  end
end
