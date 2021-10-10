require 'minitest/autorun'
require_relative '../lib/cell'

class TestCell < Minitest::Test
  def test_initialized
    target = Cell.new
    assert_equal false, target.alive?
    assert_equal 0, target.count_neighbor
  end

  def test_birth
    target = Cell.new
    target.birth
    assert_equal true, target.alive?
  end

  def test_death
    target = Cell.new
    target.birth
    target.death
    assert_equal false, target.alive?
  end

  def test_peek_next
    target = Cell.new
    target.birth
    neighbor_1 = Cell.new
    neighbor_1.birth
    target.add_neighbor neighbor_1
    neighbor_2 = Cell.new
    neighbor_2.birth
    target.add_neighbor neighbor_2
    neighbor_3 = Cell.new
    neighbor_3.birth
    target.add_neighbor neighbor_3
    assert_equal true, target.peek_next
  end

  def test_add_neighbor
    target = Cell.new
    target.add_neighbor Cell.new
    assert_equal 1, target.count_neighbor
  end
end
