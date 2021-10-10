class Cell
  def initialize
    @isLiving = false
    @neighbors = []
  end

  def birth
    @isLiving = true
  end

  def death
    @isLiving = false
  end

  def alive?
    @isLiving
  end

  def add_neighbor neighbor
    @neighbors << neighbor
  end

  def count_neighbor
    @neighbors.size
  end
end
