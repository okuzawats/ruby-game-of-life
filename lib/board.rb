require_relative './cell'

class Board
  SIZE = 32
  INITIAL_LIVING_CELLS = 16

  def initialize
    @cells = (Array.new(INITIAL_LIVING_CELLS) { true } + Array.new(SIZE**2 - INITIAL_LIVING_CELLS) { false })
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
