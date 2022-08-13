class Game
    attr_reader :code
    def initialize()
        @turn = 1
        @colors = ['blue', 'red', 'green', 'yellow',
            'black', 'orange', 'white', 'purple']
        @code = []
        @player_choice = []
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
            puts "You Win!"
            return
        end
        
        @turn += 1
        p result
        puts "Round #{@turn} of 12"
    end

    def play
        self.make_code
        while @stop == false
            self.make_choice
            self.check_guess
        end
    end
end

game = Game.new()
game.play
