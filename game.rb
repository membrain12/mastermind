class Game
    attr_reader :code
    def initialize()
        @turn = 1
        @colors = ['blue', 'red', 'green', 'yellow',
            'black', 'orange', 'white', 'purple']
        @code = []
        @player_choice = []
        @player = "The Player"
        @stop = false
    end

    def make_code()
        arr = @colors.sample(4)
        @code = arr
        puts "Round #{@turn}"
    end

    def make_choice()
        puts "Choose 4 of these colors with no repeats"
        puts
        @colors.each do |i|
            print i + " "
        end
        puts
        arr = []
        while arr.length < 4
            puts "Color ##{arr.length + 1}"
            choice = gets.chomp
            if choice == "quit"
                @stop = true
                return
            end
            if arr.include?(choice)
                print("That color has already been chosen")
                next
            elif (choice == 'quit')
                return
            elif (!@colors.include?(choice))
                print("That's not a color option. Please try again")
                next
            else
                arr << choice
            end
        end
        @player_choice = arr
    end

    def check_guess()
        return if @stop
        result = []
        @player_choice.each_with_index do |k, i|
            if !@code.include?(k)
                result << "Color not included"
            elsif @code[i]  == k
                result << "Correct"
            else 
                result << "Correct Color, but Wrong Spot"
            end 
        end
        if @player_choice == @code
            @stop = true 
            puts "#{@player} Wins!"
            return
        end
        
        @turn += 1
        p result
        puts "Round #{@turn} of 12"
    end

    def play
        game_mode = guess_or_create

        if game_mode == "guess"
            self.make_code
            while @stop == false
                self.make_choice
                self.check_guess
            end
        else
            player_make_code
            while @stop == false
                comp_make_guess
                check_guess
            end
        end

        
    end

    def guess_or_create
        puts "Do you want to create the code or guess?"
        choice = ""
        while choice != "create" && choice != "guess"
            puts "Please type create or guess"
            choice = gets.chomp
        end
        @player = "The Computer" if choice == "create"
        return choice
    end 

    def player_make_code
        arr = []

        puts "You'll need to choose 4 colors for your code"

        while arr.length < 4
            puts "Please choose color ##{arr.length + 1} from #{@colors}"
            color = gets.chomp
            next unless @colors.include? color
            arr << color
        end
        @code = arr
    end

    def comp_make_guess
        guess = @colors.sample(4)
        @player_choice = guess
    end
end

game = Game.new()
game.play
