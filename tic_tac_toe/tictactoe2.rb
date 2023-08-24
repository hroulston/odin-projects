module TicTacToe

    WIN = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    
    class Game
        def initialize(player1 = Player, player2 = Player)
            @board = Array.new(9)
            @current_player_id = 0
            @players = [player1.new(self, "X"), player2.new(self, "O")]
            print_slow "#{which_player_name} goes first."
        end
        attr_reader :board, :current_player_id
        
        def print_slow string
            string.each_char do |value|
                print value
                sleep 0.06
            end
            puts ""
        end
        
        def play
            loop do
                place_marker(current_player)

                if player_won?(current_player)
                    print_slow "#{which_player_name} wins!"
                    print_board
                    return
                    #return will officially end the loop
                elsif board_full?
                    puts "Cats Game!"
                    print_board
                    return
                end
                switch_players!
            end
        end

        def current_player
            @players[@current_player_id]
        end

        def opposing_player_id
            1 - @current_player_id
        end
        
        def opposing_player
            @players[opposing_player_id]
        end

        def which_player_name
            opposing_player_id == 0 ? "Player 2" : "Player 1"
        end

        def switch_players!
            @current_player_id = opposing_player_id
        end

    

        def position_available
            (0..8).select {|position| @board[position].nil?}
            #looking at numbers 0-8 if the board index of that number is nil then
            # the position is available.
        end

        def place_marker(player)
            position = player.select_position!
            print_slow "#{which_player_name} chooses #{player.marker} to play position #{position}."
            @board[position + 1] = player.marker
        end

        def board_full?
            position_available.empty?
        end

        def player_won?(player)
            WIN.any? do |line|
                line.all? {|position| @board[position] == player.marker}
            end
        end

        def print_board
            #Still working through how to display board properly
            @board.each.with_index(1) do |item, index|
                print index
            end
            puts " #{@board} " "|" " #{board_array[1]} " "|" " #{board_array[2]} "
            puts separator = "-----------"
            puts " #{board_array[3]} " "|" " #{board_array[4]} " "|" " #{board_array[5]} "
            puts separator
            puts " #{board_array[6]} " "|" " #{board_array[7]} " "|" " #{board_array[8]} "
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
                @game.print_slow "Select your position number for marker #{marker}: "
                selection = gets.to_i
                return selection if @game.position_available.include?(selection)
                @game.print_slow "Position #{selection} is not available. Try again."
            end
        end
    end
end

# two_players = [TicTacToe::Player, TicTacToe::Player]
TicTacToe::Game.new.play