require 'toy_robot/robot'
require 'singleton'

module ToyRobot
  class BoardError < StandardError; end
  class Board
    include Singleton

    attr_reader :items

    def add_item(item)
      raise BoardError, 'an item is required' if item.nil?

      items.push(item)
    end

    def get_item(name)
      raise BoardError, 'a name is required' if name.nil?

      items.filter { |item| item.name == name }.first
    end

    def position_valid?(position)
      raise BoardError, 'a valid position required' if position.nil?

      position.x.between?(0, rows - 1) && position.y.between?(0, cols - 1)
    end

    private

    attr_reader :rows, :cols

    def initialize(rows: 5, cols: 5)
      @rows = rows
      @cols = cols
      @items = []
    end
  end
end
