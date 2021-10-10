class Cell
  def initialize
    @isLiving = false
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
end
