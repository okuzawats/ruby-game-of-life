require_relative './cell'

class BoardDisplayer
  def initialize(cells, width, height)
    @cells = cells
    @width = width
    @height = height
  end

  def display
    (0...@height).each do |j|
      from = j * @height
      to = from + @width
      puts @cells[from...to].map { |cell| cell.as_string }.join
    end
  end
end
