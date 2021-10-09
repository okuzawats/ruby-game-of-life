class Cell
  attr_reader :isLiving

  def initialize
    @isLiving = false
  end

  def birth
    @isLiving = true
  end

  def death
    @isLiving = false
  end
end
