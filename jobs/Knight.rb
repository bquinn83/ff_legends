require_relative "Warrior"

class Knight < Warrior
    RANKS = {1 => 20, 2 => 35, 3 => 45, 4 => 60, 5=>0}

    def initialize
        super
        @name = "Knight"
        @next_rank = RANKS[@rank]
    end
    
    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end