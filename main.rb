require_relative './lib/board'

board = Board.new
while true
  system('clear')
  board.display
  sleep 1
  board.update_cells
end
