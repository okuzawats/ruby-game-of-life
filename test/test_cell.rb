require 'minitest/autorun'
require_relative '../lib/cell'

class TestCell < Minitest::Test
  def test_initialized_true
    target = Cell.new(true)
    assert_equal true, target.alive?
  end

  def test_initialized_false
    target = Cell.new(false)
    assert_equal false, target.alive?
  end

  def test_peek_next_is_false_when_1_neighbors_alive_and_is_alive
    target = Cell.new(true)
    1.times { target.add_neighbor Cell.new(true) }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_true_when_2_neighbors_alive_and_is_alive
    target = Cell.new(true)
    2.times { target.add_neighbor Cell.new(true) }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_true_when_3_neighbors_alive_and_is_alive
    target = Cell.new(true)
    3.times { target.add_neighbor Cell.new(true) }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_false_when_4_neighbors_alive_and_is_alive
    target = Cell.new(true)
    4.times { target.add_neighbor Cell.new(true) }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_false_when_2_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    2.times { target.add_neighbor Cell.new(true) }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_true_when_3_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    3.times { target.add_neighbor Cell.new(true) }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_false_when_4_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    4.times { target.add_neighbor Cell.new(true) }
    assert_equal false, target.peek_next
  end

  def test_next_is_true_when_next_is_true
    target = Cell.new(true)
    2.times { target.add_neighbor Cell.new(true) }
    target.peek_next
    assert_equal true, target.next
  end

  def test_next_is_false_when_next_is_false
    target = Cell.new(true)
    1.times { target.add_neighbor Cell.new(true) }
    target.peek_next
    assert_equal false, target.next
  end

  def test_as_string_return_X_if_alive
    target = Cell.new(true)
    assert_equal 'X', target.as_string
  end

  def test_as_string_return_underscore_if_dead
    target = Cell.new(false)
    assert_equal '_', target.as_string
  end
end
