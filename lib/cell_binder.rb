require_relative './cell'

class CellBinder
  def initialize(living_cells, dead_cells)
    seeds = []
    seeds += Array.new(living_cells, true)
    seeds += Array.new(dead_cells, false)
    @cells = seeds
          .shuffle
          .map { |is_living| Cell.new(is_living) }
  end

  def bind_cells(width, height)
    (0...height).each do |i|
      (0...width).each do |j|
        index = i * width + j
        i - 1 >= 0 || i + 1 < height || j - 1 >= 0 || j + 1 < width
        @cells[index].tap do |cell|
          cell.add_neighbor @cells[index - width - 1] if (i - 1 >= 0 && j - 1 >= 0)
          cell.add_neighbor @cells[index - width] if (i - 1 >= 0)
          cell.add_neighbor @cells[index - width + 1] if (i - 1 >= 0 && j + 1 < width)
          cell.add_neighbor @cells[index - 1] if (j - 1 >= 0)
          cell.add_neighbor @cells[index + 1] if (j + 1 < width)
          cell.add_neighbor @cells[index + width - 1] if (i + 1 < height && j - 1 >= 0)
          cell.add_neighbor @cells[index + width] if (i + 1 < height)
          cell.add_neighbor @cells[index + width + 1] if (i + 1 < height && j + 1 < width)
        end
      end
    end
    @cells
  end
end
