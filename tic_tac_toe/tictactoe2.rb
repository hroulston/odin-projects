Module TicTacToe

WIN = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def print_slow string
    string.each_char do |value|
      putc value
      sleep 0.06
    end
    puts ""
  end

class Game
    def initialize(player1, player2)
        @board = Array.new(9)
        @current_player_id = 0
        @players = [player1.new(self, "X"), player2.new(self, "O")]
        puts print_slow "#{current_player} goes first."
    end
    attr_reader :board, :current_player_id

    def current_player
        @players[@current_player]
    end

    def opposing_player_id
        1 - @current_player_id
    end
    
    def opposing_player
        @players[opposing_player_id]
    end

    def switch_players!
        @current_player_id = opposing_player_id
    end

end