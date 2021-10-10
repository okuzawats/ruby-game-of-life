require_relative './board_displayer'
require_relative './cell'
require_relative './cell_binder'

class Board
  WIDTH = 32
  HEIGHT = 32
  CELLS = WIDTH * HEIGHT
  INITIAL_LIVING_CELLS = 128
  INITIAL_DEAD_CELLS = CELLS - INITIAL_LIVING_CELLS

  def initialize
    cell_binder = CellBinder.new(INITIAL_LIVING_CELLS, INITIAL_DEAD_CELLS)
    @cells = cell_binder.bind_cells(WIDTH, HEIGHT)
    @displayer = BoardDisplayer.new(@cells, WIDTH, HEIGHT)
  end

  def update_cells
    @cells.each { |cell| cell.peek_next }
    @cells.each { |cell| cell.next }
  end

  def cells_size
    @cells.size
  end

  def living_cells_size
    @cells.select { |cell| cell.alive? }.size
  end

  def display
    @displayer.display
  end
end
