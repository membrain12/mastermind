import random

class Game:
    def __init__(self):
        self.turn = 1
        self.colors = ['blue', 'red', 'green', 'yellow',
                        'black', 'orange', 'white', 'purple']
        self.code = []

    def make_code(self):
        arr = []
        choice = random.choice(self.colors)
        while len(arr) < 4:
            while choice in arr:
                choice = random.choice(self.colors)
            arr.append(choice)
        self.code = arr

    

game = Game()
game.make_code()
print(game.code)
