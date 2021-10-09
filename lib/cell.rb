class Cell
  attr_reader :isLiving

  def initialize
    @isLiving = false
  end

  def giveLife
    @isLiving = true
  end
end
