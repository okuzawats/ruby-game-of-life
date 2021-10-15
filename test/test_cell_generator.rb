require 'minitest/autorun'
require_relative '../lib/cell_generator'
require_relative '../lib/dimens'
require_relative '../lib/envs'

class TestCellGenerator < Minitest::Test
  def test_generate
    target = CellGenerator.new
    assert_equal Dimens::WIDTH * Dimens::HEIGHT, target.cells_size
  end

  def test_bind
    target = CellGenerator.new
    assert_equal Envs::INITIAL_LIVING_CELLS, target.living_cells_size
  end
end
