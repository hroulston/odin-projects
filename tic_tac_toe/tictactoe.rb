$player1 = ""
$player2 = "" 
$board_array = [1,2,3,4,5,6,7,8,9]
$board_in_play = []

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

def choose_position1
  position = "First player, type in number of position you want to play."
  print_slow position
  position_answer = gets.chomp
  index_position = position_answer.to_i - 1
  $board_array[index_position] = $player1
  game_board($board_array)
end

choose_position1

# def choose_position2
#   position = "Second player, type in number of position you want to play."
#   print_slow position
#   position_answer = gets.chomp

#   board_in_play = board_array.map{ |n, position_answer| n == position_answer? player2 : n }
#   game_board(board_in_play)
# end


