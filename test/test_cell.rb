require 'minitest/autorun'
require_relative '../lib/cell'

class TestCell < Minitest::Test
  def test_initialized
    target = Cell.new
    assert_equal false, target.isLiving
  end

  def test_giveLife
    target = Cell.new
    target.giveLife
    assert_equal true, target.isLiving
  end
end
