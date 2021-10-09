require 'minitest/autorun'
require_relative '../lib/cell'

class TestCell < Minitest::Test
  def test_initialized
    target = Cell.new
    assert_equal false, target.isLiving
  end

  def test_birth
    target = Cell.new
    target.birth
    assert_equal true, target.isLiving
  end

  def test_death
    target = Cell.new
    target.birth
    target.death
    assert_equal false, target.isLiving
  end
end
