require_relative './cell'

class Board
  WIDTH = 32
  HEIGHT = 32
  CELLS = WIDTH * HEIGHT
  INITIAL_LIVING_CELLS = 128
  INITIAL_DEAD_CELLS = CELLS - INITIAL_LIVING_CELLS

  def initialize
    @cells = (Array.new(INITIAL_LIVING_CELLS, true) + Array.new(INITIAL_DEAD_CELLS, false))
      .shuffle
      .map { |is_living| Cell.new(is_living) }
    bind_cells
  end

  def bind_cells
    (0...HEIGHT).each { |i|
      (0...WIDTH).each { |j|
        index = i * WIDTH + j
        i - 1 >= 0 || i + 1 < HEIGHT || j - 1 >= 0 || j + 1 < WIDTH
        @cells[index].tap do |cell|
          cell.add_neighbor @cells[index - WIDTH - 1] if (i - 1 >= 0 && j - 1 >= 0)
          cell.add_neighbor @cells[index - WIDTH] if (i - 1 >= 0)
          cell.add_neighbor @cells[index - WIDTH + 1] if (i - 1 >= 0 && j + 1 < WIDTH)
          cell.add_neighbor @cells[index - 1] if (j - 1 >= 0)
          cell.add_neighbor @cells[index + 1] if (j + 1 < WIDTH)
          cell.add_neighbor @cells[index + WIDTH - 1] if (i + 1 < HEIGHT && j - 1 >= 0)
          cell.add_neighbor @cells[index + WIDTH] if (i + 1 < HEIGHT)
          cell.add_neighbor @cells[index + WIDTH + 1] if (i + 1 < HEIGHT && j + 1 < WIDTH)
        end
      }
    }
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
    (0...HEIGHT).each { |i|
      (0...WIDTH).each { |j|
        index = i * WIDTH + j
        print @cells[index].display
      }
      puts ''
    }
  end
end
