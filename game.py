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

    def make_choice(self):
        print("Choose 4 of these colors with no repeats\n")
        for i in self.colors:
            print(f"{i}", end=" ")
        print("\n")
        arr = []
        while len(arr) < 4:
            choice = input(f"Color #{len(arr)+1}\n")
            if choice in arr:
                print("That color has already been chosen")
                continue
            elif (choice == 'quit'):
                return
            elif (choice not in self.colors):
                print("That's not a color option. Please try again")
                continue
            else:
                arr.append(choice)
        return arr     

    

game = Game()
game.make_code()
print(game.code)
print(game.make_choice())

