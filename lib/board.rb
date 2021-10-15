require_relative './board_displayer'
require_relative './cell'
require_relative './cell_generator'

class Board
  def initialize
    @cells = CellGenerator.new.provide
    @displayer = BoardDisplayer.new(@cells)
  end

  def next
    @cells.each(&:peek_next)
    @cells.each(&:next)
  end

  def display
    @displayer.display
  end
end
