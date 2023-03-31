

class Player
    attr_reader :name, :symbol, :moves_made
    def initialize(symbol, name)
        @name = name
        @symbol = symbol
        @moves_made = []
    end

end

class TicTacToe
    attr_reader :available_positions, :player, :current_player

    WINNING_COMBOS = [
        [1, 2, 3], [4, 5, 6], [7, 8, 9],
        [1, 4, 7], [2, 5, 9], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]
    ]

    def initialize
        @player = [
            Player.new('x', 'Player_1'),
            Player.new('o', 'Player_2')
        ]
        @available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @current_player = @player[0]
    end

    def play
        puts "Welcome to a game of Tic Tac Toe"
        sleep(0.5)
        #game_board
        loop do
        move = get_input
        break if winner? == true
        switch_player
        end
        #print board
    end

    def get_input
        puts "#{@current_player.name} make the move!"
        move = gets.to_i
        validate_input(move)
    end

    def validate_input(move)
        if available_positions.include?(move)
            update_available_positions(move)

            return move
        end
        puts "This is not a valid move, try again"
        sleep(0.5)
        get_input 
    end
    
    def update_available_positions(move)
        available_positions.delete(move)
        @current_player.moves_made.push(move)
    end

    def switch_player
        @current_player = @current_player == @player[0] ? @player[1] : @player[0]
        
    end

    def winner?
        if WINNING_COMBOS.any? { |combo| (combo & current_player.moves_made) == combo }
            puts "The winner is #{current_player.name}"
            play_again?
            return true
        end
    end

    def play_again?
        sleep(1)
        puts "Wanna play another one? Enter y if yes. Or enter n to quit"
        answer = gets.chomp
        answer == "y" ? TicTacToe.new.play : return
    end





end 
new_game = TicTacToe.new 
new_game.play