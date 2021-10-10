require 'minitest/autorun'
require_relative '../lib/board'

class TestBoard < Minitest::Test
  def test_initialized_create_cells
    target = Board.new
    assert_equal Board::SIZE**2, target.cells.size
  end

  def test_initialized_give_life_to_cells
    target = Board.new
    assert_equal Board::INITIAL_LIVING_CELL_COUNT, target.cells.select { |cell| cell.alive? }.size
  end
end
