require 'minitest/autorun'
require_relative '../lib/cell'

class TestCell < Minitest::Test
  def test_initialized
    target = Cell.new
    assert_equal false, target.isLiving
  end
end
