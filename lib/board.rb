require_relative './cell'

class Board
  SIZE = 32
  INITIAL_LIVING_CELL_COUNT = 16

  attr_reader :cells

  def initialize
    @cells = Array.new(SIZE**2) { Cell.new }
    @cells.sample(INITIAL_LIVING_CELL_COUNT).each { |cell|
      cell.birth
    }
  end
end
