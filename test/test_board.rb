require 'minitest/autorun'
require_relative '../lib/board'
require_relative '../lib/dimens'
require_relative '../lib/envs'

class TestBoard < Minitest::Test
  def test_initialized_create_cells
    target = Board.new
    assert_equal Dimens::WIDTH * Dimens::HEIGHT, target.cells_size
  end

  def test_initialized_give_life_to_cells
    target = Board.new
    assert_equal Envs::INITIAL_LIVING_CELLS, target.living_cells_size
  end
end
