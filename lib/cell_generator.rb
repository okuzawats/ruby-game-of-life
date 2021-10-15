require_relative './cell'
require_relative './dimens'
require_relative './envs'

class CellGenerator
  def initialize
    @width, @height = Dimens.new.size
    @cells = []
    generate
    bind
  end

  def provide
    @cells
  end

  # visible for testing
  def cells_size
    @cells.size
  end

  # visible for testing
  def living_cells_size
    @cells.select(&:alive?).size
  end

  private

  def generate
    living_cells = Envs.new.initial_cells
    dead_cells = @width * @height - living_cells
    seeds = []
    seeds += Array.new(living_cells, true)
    seeds += Array.new(dead_cells, false)
    @cells = seeds
             .shuffle
             .map { |alive| Cell.new(alive) }
  end

  def bind
    (0...@height).each do |j|
      (0...@width).each do |i|
        index = j * @width + i
        @cells[index].tap do |cell|
          cell.add_neighbor @cells[index - @width - 1] if j - 1 >= 0 && i - 1 >= 0
          cell.add_neighbor @cells[index - @width] if j - 1 >= 0
          cell.add_neighbor @cells[index - @width + 1] if j - 1 >= 0 && i + 1 < @width
          cell.add_neighbor @cells[index - 1] if i - 1 >= 0
          cell.add_neighbor @cells[index + 1] if i + 1 < @width
          cell.add_neighbor @cells[index + @width - 1] if j + 1 < @height && i - 1 >= 0
          cell.add_neighbor @cells[index + @width] if j + 1 < @height
          cell.add_neighbor @cells[index + @width + 1] if j + 1 < @height && i + 1 < @width
        end
      end
    end
  end
end
