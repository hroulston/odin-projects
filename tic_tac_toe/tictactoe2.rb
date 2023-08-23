Module TicTacToe

WIN = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def print_slow string
    string.each_char do |value|
      puts value
      sleep 0.06
    end
    puts ""
  end

class Game
    def initialize(player1, player2)
        @board = Array.new(9)
        @current_player_id = 0
        @players = [player1.new(self, "X"), player2.new(self, "O")]
        print_slow "#{which_player_name} goes first."
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

    def which_player_name
        opposing_player_id == 0 ? "Player 1" : "Player 2"
    end

    def switch_players!
        @current_player_id = opposing_player_id
    end

    def play
    end

    def position_available
        (0..8).select {|position| @board[position].nil?}
        #looking at numbers 0-8 if the board index of that number is nil then
        # the position is available.
    end

    def place_marker

    end

    def board_full?
    end

    def player_won?
    end

    def print_board
    end
end

class Player
    def initialize(game, marker)
        @game = game
        @marker = marker
    end
    attr_reader :marker

    def select_position!
        #makes the change immutable so another player cannot take this position by using bang.
        @game.print_board
        loop do
            print_slow "Select your position number for marker #{marker}: "
            selction = gets.to_i
            return selection if @game.position_available.include?(selection)
            print_slow "Position #{selection} is not available. Try again."
        end
    end
end