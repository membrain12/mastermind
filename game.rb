class Game
    attr_reader :code
    def initialize()
        @turn = 1
        @colors = ['blue', 'red', 'green', 'yellow',
            'black', 'orange', 'white', 'purple']
        @code = []
    end

    def make_code()
        arr = @colors.sample(4)
        @code = arr
    end
end

game = Game.new()
