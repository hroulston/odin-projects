def print_slow string
    string.each_char do |value|
      putc value
      sleep 0.06
    end
    puts ""
  end

player1 = ""
player2 = "" 


def game_board(board)
  puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
  puts separator = "-----------"
  puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
  puts separator
  puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
end

board_array = [1,2,3,4,5,6,7,8,9]
game_board(board_array)

def start_game
  intro = "Would you like to play tic tac toe?"
  print_slow intro
  gets.chomp
end

game_answer = start_game

def yes_or_no(response, choice)
  if response.downcase == choice
    choose_token
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
    player1 = "X"
    player2 = "O"
    puts "First player is X, second player is O."
    choose_position
  else
    player1 = "O"
    player2 = "X"
    puts "First player is O, second player is X."
    choose_position
  end
end


def choose_position
  position = "First player, type in number of position you want to play."
  print_slow position
  position_answer = gets.chomp
end


