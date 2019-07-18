require_relative "Black_Mage"

class Summoner < Black_Mage
    RANKS = {1 => 20, 2 => 35, 3 => 45, 4 => 60, 5=>0}
    POSITION = 12
    def initialize
        super
        @name = "Summoner"
        @next_rank = RANKS[1]
    end
        def rank_up
        super
        @next_rank = RANKS[@rank]
    end
end