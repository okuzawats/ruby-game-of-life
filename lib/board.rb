require_relative './cell'

class Board
  CELLS = 32**2
  INITIAL_LIVING_CELLS = 16

  def initialize
    @cells = (Array.new(INITIAL_LIVING_CELLS, true) + Array.new(CELLS - INITIAL_LIVING_CELLS, false))
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
