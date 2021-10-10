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

  def test_peek_next_is_false_when_1_neighbors_alive_and_is_alive
    target = Cell.new(true)
    1.times {
      neighbor = Cell.new(true)
      target.add_neighbor neighbor
    }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_true_when_2_neighbors_alive_and_is_alive
    target = Cell.new(true)
    2.times {
      neighbor = Cell.new(true)
      target.add_neighbor neighbor
    }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_true_when_3_neighbors_alive_and_is_alive
    target = Cell.new(true)
    3.times {
      neighbor = Cell.new(true)
      target.add_neighbor neighbor
    }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_false_when_4_neighbors_alive_and_is_alive
    target = Cell.new(true)
    4.times {
      neighbor = Cell.new(true)
      target.add_neighbor neighbor
    }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_false_when_2_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    2.times {
        neighbor = Cell.new(true)
        target.add_neighbor neighbor
    }
    assert_equal false, target.peek_next
  end

  def test_peek_next_is_true_when_3_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    3.times {
        neighbor = Cell.new(true)
        target.add_neighbor neighbor
    }
    assert_equal true, target.peek_next
  end

  def test_peek_next_is_false_when_4_neighbors_alive_and_is_not_alive
    target = Cell.new(false)
    4.times {
      neighbor = Cell.new(true)
      target.add_neighbor neighbor
    }
    assert_equal false, target.peek_next
  end

  def test_add_neighbor
    target = Cell.new
    target.add_neighbor Cell.new
    assert_equal 1, target.count_neighbor
  end
end
