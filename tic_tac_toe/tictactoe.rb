def print_slow string
    string.each_char do |value|
      putc value
      sleep 0.06
    end
    puts ""
  end

def game_board
    puts " #{1} " "|" " #{2} " "|" " #{3} "
    puts separator = "-----------"
    puts " #{4} " "|" " #{5} " "|" " #{6} "
    puts separator
    puts " #{7} " "|" " #{8} " "|" " #{9} "
end

def start_game
    intro = "Would you like to play?"
    print_slow intro
    gets.chomp
end

def choose_token

end