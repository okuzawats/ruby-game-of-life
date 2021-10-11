require_relative './cell'
require_relative './dimens'

class BoardDisplayer
  def initialize(cells)
    @width, @height = Dimens.new.size
    @cells = cells
  end

  def display
    (0...@height).each do |j|
      from = j * @height
      to = from + @width
      puts @cells[from...to].map(&:as_string).join
    end
  end
end
