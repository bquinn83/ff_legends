#welcome screen v0.1

require 'colorize'

require "./save_data/save.rb"
require "./game.rb"

class Welcome
    def self.welcome_screen
        system("clear")

        puts "".on_red
        puts "".ljust(5) + "FF Legends!".on_red
        puts "".ljust(8) + "v0.1".on_red
        puts "".on_red + "\n\n"

        puts "Menu:".blue

        puts "  N:".ljust(10).cyan + "New Game"
        puts "  L:".ljust(10).cyan + "Load Game"
        puts "  O:".ljust(10).cyan + "Options"
        puts "  Q:".ljust(10).cyan + "Quit"

        puts
        puts

        puts 'Input:'
        input = gets.chop.downcase.to_sym

        case input
        when :n
        when :l
            #TO-DO: create load screen
            game = load_game("./save_data/saves/save.gsf")
            Run.run_game(game)
        when :o
        when :q
            exit(0)
        end
    end
end