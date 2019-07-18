#This is the gametime runfile, v0.3 for testing purposes
require 'byebug'
require_relative "Party"
require_relative "Character"
require "./save_data/save.rb"

include Save_Game

class Run
    attr_reader :characters, :my_party
    def initialize(party_size = 4, show_stats = true, show_jobs = false)
        @my_party = Party.new(party_size)
        load_characters
        load_jobs
        load_party
        load_settings
    end

    def load_characters
        @characters = {
            Cloud: Character.new("Cloud", 250, 125),
            Barrett: Character.new("Barrett", 300, 50),
            Tifa: Character.new("Tifa", 200, 100),
            Aeris: Character.new("Aeris", 100, 150),
            Squall: Character.new("Squall", 200, 100),
            Rinoa: Character.new("Rinoa", 150, 100),
            Zell: Character.new("Zell", 250, 80),
            Zidane: Character.new("Zidane", 150, 100),
            Vivi: Character.new("Vivi", 150, 200),
            Cid: Character.new("Cid", 300, 50),
            Yuna: Character.new("Yuna", 170, 140)
        }
    end
    def load_jobs
        @characters.each_value do |character|
            character.add_job(:Warrior, Warrior.new)
            character.add_job(:Thief, Thief.new)
            character.add_job(:Monk, Monk.new)
            character.add_job(:White_Mage, White_Mage.new)
            character.add_job(:Black_Mage, Black_Mage.new)
        end
    end
    def load_party
        @my_party.add_character(@characters[:Cloud])
        @my_party.add_character(@characters[:Barrett])
        @my_party.add_character(@characters[:Tifa])
        @my_party.add_character(@characters[:Aeris])
        @my_party.add_character(@characters[:Squall])
        @my_party.add_character(@characters[:Rinoa])
        @my_party.add_character(@characters[:Zell])
        @my_party.add_character(@characters[:Zidane])
        @my_party.add_character(@characters[:Vivi])
    end
    def load_settings
        Character.toggle_stats
        Character.toggle_jobs
        Party.toggle_standby_exp
        Party.toggle_standby_jp
    end

#Test Character.change_job
    def set_jobs
        @characters[:Cloud].change_job(:Warrior)
        @characters[:Barrett].change_job(:Warrior)
        @characters[:Aeris].change_job(:White_Mage)
        @characters[:Tifa].change_job(:Monk)
        @characters[:Rinoa].change_job(:White_Mage)
        @characters[:Zell].change_job(:Monk)
        @characters[:Zidane].change_job(:Thief)
        @characters[:Vivi].change_job(:Black_Mage)
    end

#Output Party status
    def to_s 
        return @my_party
    end

    def self.run_game(game)
        # game.my_party.reward_experience(0, 200)
        # game.set_jobs
        # game.my_party.reward_experience(160000, 200)
        # game.characters[:Cloud].change_job(:Monk)
        # game.my_party.reward_experience(0, 200)
        # game.characters[:Cloud].change_job(:White_Mage)
        # game.my_party.reward_experience(0,200)
        # game.characters[:Cloud].change_job(:Black_Mage)
        # game.my_party.reward_experience(0,220)
        puts game.to_s
    end

end

game = Run.new


                        ##Serialize with YAML & save file

## welcome screen
                        ## display welcome options
                            ##new game
                            ##load game
                            ##settings
    ##new game
        ##load characters
        ##load jobs
        ##start game
    ##load game
        ##load game data
        ##enter into game
    ##settings

##create map
##create movement menu
##create in game menu