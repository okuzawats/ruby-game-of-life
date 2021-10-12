class Cell
  LIVING_CELL = 'X'
  DEAD_CELL = '_'

  ALIVE_IF_ALIVE_AND_NEIGHBORS = [2, 3].freeze
  ALIVE_IF_DEAD_AND_NEIGHBORS = [3].freeze

  def initialize(is_living = false)
    @is_living = is_living
    @is_living_next = false
    @neighbors = []
  end

  def alive?
    @is_living
  end

  def add_neighbor neighbor
    @neighbors << neighbor
  end

  def peek_next
    neighbors_alive = @neighbors.select(&:alive?).size
    @is_living_next = if alive?
      ALIVE_IF_ALIVE_AND_NEIGHBORS.include?(neighbors_alive)
    else
      ALIVE_IF_DEAD_AND_NEIGHBORS.include?(neighbors_alive)
    end
    @is_living_next
  end

  def next
    @is_living = @is_living_next
    @is_living_next = false
    @is_living
  end

  def as_string
    alive? ? LIVING_CELL : DEAD_CELL
  end
end
