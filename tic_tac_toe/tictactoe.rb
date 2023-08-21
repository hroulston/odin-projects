$player1 = ""
$player2 = "" 
$board_array = [1,2,3,4,5,6,7,8,9]
$board_in_play = []
winning_combos = [
  [0,1,2]
  [3,4,5]
  [6,7,8]
  [0,3,6]
  [1,4,7]
  [2,5,8]
  [0,4,8]
  [2,4,6]
]

def print_slow string
    string.each_char do |value|
      putc value
      sleep 0.06
    end
    puts ""
  end

def game_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts separator = "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts separator
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

game_board($board_array)

def start_game
  intro = "Would you like to play tic tac toe?"
  print_slow intro
  gets.chomp
end

game_answer = start_game

def yes_or_no(response, choice)
  if response.downcase == choice
    puts "Awesome!"
  else
    puts "Goodbye!"
  end
end

yes_or_no(game_answer, "yes")

def choose_token
  token = "First player, do you want to be X or O?"
  print_slow token
  token_answer = gets.chomp

  if token_answer.downcase == "x"
    $player1 = "X"
    $player2 = "O"
    puts "First player is X, second player is O."
  else
    $player1 = "O"
    $player2 = "X"
    puts "First player is O, second player is X."
  end
end

choose_token

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  end
end

def choose_position1
  position = "First player, type in number of position you want to play."
  print_slow position
  position_answer = gets.chomp
  index_position = position_answer.to_i - 1
  if valid_move?($board_array, index_position)
    $board_array[index_position] = $player1
    choose_position1
  end
  game_board($board_array)
end

choose_position1

def choose_position2
  position = "Second player, type in number of position you want to play."
  print_slow position
  position_answer = gets.chomp
  index_position = position_answer.to_i - 1
  if valid_move?($board_array, index_position)
    $board_array[index_position] = $player2
    choose_position2
  end
  game_board($board_array)
end

choose_position2

def turn_count(board_array)
  counter = 0
  board_array.each do |space|
    if space == "x" || space == "O"
      counter += 1
    end
  end
  counter
end

def whose_turn(board_array)
  turn_count(board_array) % 2 == 0 ? choose_position2 : choose_position1
end

# def game_play(board_array)
#   until turn_count(board_array) == 9
#     whose_turn(board_array)
#   end
# end

# game_play($board_array)