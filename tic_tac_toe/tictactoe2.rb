module TicTacToe

    WIN = [[1,2,3], [4,5,6], [7,8,9], [1,5,9], [3,5,7], [1,4,7], [3,6,9], [2,5,8]]

    
    class Game
        def initialize(player1 = Player, player2 = Player)
            @board = Array.new(10)
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
            (1..9).select {|position| @board[position].nil?}
            #looking at numbers 0-8 if the board index of that number is nil then
            # the position is available.
        end

        def place_marker(player)
            position = player.select_position!
            print_slow "#{which_player_name} chooses #{player.marker} to play position #{position}."
            @board[position] = player.marker
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
            board_array = [1,2,3,4,5,6,7,8,9]
            puts " #{@board[1] == nil ? board_array[0] : @board[1]} " "|" " #{@board[2] == nil ? board_array[1] : @board[2]} " "|" " #{@board[3] == nil ? board_array[2] : @board[3]} "
            puts separator = "-----------"
            puts " #{@board[4] == nil ? board_array[3] : @board[4]} " "|" " #{@board[5] == nil ? board_array[4] : @board[5]} " "|" " #{@board[6] == nil ? board_array[5] : @board[6]} "
            puts separator
            puts " #{@board[7] == nil ? board_array[6] : @board[7]} " "|" " #{@board[8] == nil ? board_array[7] : @board[8]} " "|" " #{@board[9] == nil ? board_array[8] : @board[9]} "
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