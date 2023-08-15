def game_board(board)
    puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
    puts separator = "-----------"
    puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
    puts separator
    puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
  end

board_array = [1,2,3,4,5,6,7,8,9]
game_board(board_array)
