require_relative "Jobs"

class Warrior < Jobs
    RANKS = {1 => 20, 2 => 35, 3 => 45, 4 => 60}

    def initialize
        super
        @name = "Warrior"
        @next_rank = RANKS[1]
    end
    
    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end