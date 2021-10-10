class Cell

  def initialize
    @is_living = false
    @is_living_next = false
    @neighbors = []
  end

  def birth
    @is_living = true
  end

  def death
    @is_living = false
  end

  def alive?
    @is_living
  end

  def peek_next
    neighbors_alive = @neighbors.select { |cell| cell.alive? }
    if alive?
      @is_living_next = (neighbors_alive.size == 2) || (neighbors_alive.size == 3)
    else
      @is_living_next = (neighbors_alive == 3)
    end
    @is_living_next
  end

  def add_neighbor neighbor
    @neighbors << neighbor
  end

  def count_neighbor
    @neighbors.size
  end
end
