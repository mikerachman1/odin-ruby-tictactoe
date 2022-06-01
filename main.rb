class TicTacToe
    def initialize
        puts "Enter the name of Player 1"
        @player1 = gets.chomp
        puts "Hello #{@player1}! Enter name of player 2."
        @player2 = gets.chomp
        puts "Hello #{@player2}! Lets play!"
        @board = Array.new(3) {Array.new(3)} #Creates empty nested array [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
        @winner = 0 #to be used in a conditional loop to determine winner
        @turn = rand(1..2) #Randomly selects a number to correspond to whoever goes first
    end

    #private
    def board_display
        @board.each do |row|
            row.each_with_index do |column, index|
                if column == nil
                    print ' ~ '
                elsif column == 'X'
                    print ' X '
                elsif column == 'O'
                    print ' O '
                end
                
                if index < 2
                    print ' | '
                end 
            end
            puts
        end
    end

    #private
    def make_move
        if @turn == 1
            puts "#{@player1}, make your move!"
            game_piece = 'X'
        else 
            puts "#{@player2}, make your move!"
            game_piece = 'O'
        end
        
        move = gets.chomp.split() #accept user move input then turns into array

        #check  valid input
        #if move.length !== 2 || move[0] > 2 || move[1] > 2 || move[0] < 0 || move[1] < 0
        #    puts "bad input" #temporary
            #bad_input --need to define this method
        #end

        #make the move now
        row = move[0].to_i
        column = move[1].to_i

        @board[row][column] = game_piece
    end    
end

game = TicTacToe.new
game.board_display
game.make_move
game.board_display