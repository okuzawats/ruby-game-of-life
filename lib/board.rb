require_relative './board_displayer'
require_relative './cell'
require_relative './cell_binder'
require_relative './dimens'
require_relative './envs'

class Board
  def initialize
    width, height, size = Dimens.new.size
    living_cells, dead_cells = Envs.new.initial_cells(size)

    @cells = CellBinder.new(living_cells, dead_cells).bind_cells(width, height)
    @displayer = BoardDisplayer.new(@cells)
  end

  def update_cells
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
