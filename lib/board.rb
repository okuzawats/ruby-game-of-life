require_relative './cell'

class Board
  WIDTH = 32
  HEIGHT = 32
  CELLS = WIDTH * HEIGHT
  INITIAL_LIVING_CELLS = 16
  INITIAL_DEAD_CELLS = CELLS - INITIAL_LIVING_CELLS

  def initialize
    @cells = (Array.new(INITIAL_LIVING_CELLS, true) + Array.new(INITIAL_DEAD_CELLS, false))
      .shuffle
      .map { |is_living| Cell.new(is_living) }
  end

  def cells_size
    @cells.size
  end

  def living_cells_size
    @cells.select { |cell| cell.alive? }.size
  end
end
