require_relative './board_displayer'
require_relative './cell'
require_relative './cell_binder'
require_relative './dimens'
require_relative './envs'

class Board
  def initialize
    @cells = CellBinder.new.bind_cells
    @displayer = BoardDisplayer.new(@cells)
  end

  def update
    @cells.each(&:peek_next)
    @cells.each(&:next)
  end

  def display
    @displayer.display
  end

  # visible for testing
  def cells_size
    @cells.size
  end

  # visible for testing
  def living_cells_size
    @cells.select(&:alive?).size
  end
end
