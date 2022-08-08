import random

class Game:
    def __init__(self):
        self.turn = 1
        self.colors = ['blue', 'red', 'green', 'yellow',
                        'black', 'orange', 'white', 'purple']
        self.code = []
        self.player_guess = []
        self.quit = False

    def make_code(self):
        arr = random.sample(self.colors, 4)
        self.code = arr
        print(self.code)

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
            elif (choice not in self.colors):
                print("That's not a color option. Please try again")
                continue
            else:
                arr.append(choice)
        self.player_guess = arr
        self.turn += 1
    def check_guess(self):
        feedback = []
        for index, guess in enumerate(self.player_guess):
            if guess in self.code and self.code[index] == guess:
                feedback.append([guess, "Correct"])
                continue
            if guess in self.code:
                feedback.append([guess, "Correct, but wrong spot"])
                continue
            else:
                feedback.append([guess, "Wrong"])
        print(f"Round: {self.turn}")
        print(feedback)
        print()

    def play(self):
        game.make_code()

        while(self.turn < 13):
            game.make_choice()
            game.check_guess()



game = Game()
game.play()