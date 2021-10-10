require 'minitest/autorun'
require_relative '../lib/board'

class TestBoard < Minitest::Test
  def test_initialized_create_cells
    target = Board.new
    assert_equal Board::CELLS, target.cells_size
  end

  def test_initialized_give_life_to_cells
    target = Board.new
    assert_equal Board::INITIAL_LIVING_CELLS, target.living_cells_size
  end
end
