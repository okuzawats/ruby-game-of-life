require_relative './board_displayer'
require_relative './cell'
require_relative './cell_binder'
require_relative './dimens'
require_relative './envs'

class Board
  def initialize
    width, height, size = Dimens.new.size
    envs = Envs.new
    living_cells = envs.initial_cells
    dead_cells = size - living_cells

    @cells = CellBinder.new(living_cells, dead_cells).bind_cells(width, height)
    @displayer = BoardDisplayer.new(@cells, width, height)
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
