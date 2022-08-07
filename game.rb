class Game
    attr_reader :code
    def initialize()
        @turn = 1
        @colors = ['blue', 'red', 'green', 'yellow',
            'black', 'orange', 'white', 'purple']
        @code = []
        @player_choice = []
    end

    def make_code()
        arr = @colors.sample(4)
        @code = arr
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
end

game = Game.new()
game.make_choice
