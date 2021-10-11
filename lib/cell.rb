class Cell
  LIVING_CELL = 'X'
  DEAD_CELL = '_'

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
    if alive?
      @is_living_next = neighbors_alive == 2 || neighbors_alive == 3
    else
      @is_living_next = neighbors_alive == 3
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
