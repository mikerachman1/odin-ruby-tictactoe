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
        move.map! { |value| value.to_i }

        #check valid input
        if move.length != 2 || move[0] > 2 || move[1] > 2 || move[0] < 0 || move[1] < 0
            puts "bad input" #temporary
        end

        #Add check here for valid move

        row = move[0]
        column = move[1]

        @board[row][column] = game_piece
    end
    
    #private
    def change_turn
        if @turn == 1
            @turn = 2
        else
            @turn = 1
        end
    end

    #private
    def check_winner
        #checks across
        @board.each do |row|
            if row.all?('O')
                puts "#{@player2} wins across"
                @winner = 1
            elsif row.all?('X')
                puts "#{@player1} wins across"
                @winner = 1
            end
        end
        #checks vertical    
        0.upto(2) do |index| 
            if @board.all? {|row| row[index] == 'O'}
                puts "#{@player2} wins vertical"
                @winner = 1
            elsif @board.all? {|row| row[index] == 'X'}
                puts "#{@player1} wins vertical"
                @winner = 1
            end
        end
        #checks diagonal right
        if @board[0][0] == @board[1][1] && @board[2][2] == @board[1][1]
            if @board[0][0] == 'O'
              puts "#{@player2} wins diagonal"
              @winner = 1
            elsif @board[0][0] == 'X'
              puts "#{@player1} wins diagonal"
              @winner = 1
            end
          end
        #checks diagonal left
        if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
            if @board[0][2] == 'O'
              puts "#{@player2} wins diagonal"
              @winner = 1
            elsif @board[0][2] == 'X'
              puts "#{@player1} wins diagonal"
              @winner = 1
            end
        end
        #check for stalemate
        @board.each_with_index do |row, index|
            if row.include?(nil)
              contains_nil = true
              break
            else
              contains_nil = false
            end
            if contains_nil == false && index == 2
              puts "Stalemate!"
              @winner = 1
            end
          end
    end

    public
    def play_game
        while @winner == 0
            make_move
            board_display
            check_winner
            change_turn
        end
        puts "GAME OVER"
    end

end

game = TicTacToe.new
game.play_game