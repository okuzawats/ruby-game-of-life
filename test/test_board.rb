require 'minitest/autorun'
require_relative '../lib/board'

class TestBoard < Minitest::Test
  def test_initialized
    target = Board.new
    assert_equal Board::SIZE**2, target.cells.size
  end
end
