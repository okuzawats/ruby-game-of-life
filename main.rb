require_relative './lib/board'

ONE_SECOND = 1

board = Board.new

while true
  system('clear')
  board.display
  board.update
  sleep ONE_SECOND
end
