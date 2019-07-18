require_relative "Jobs"

class Ninja < Monk
    RANKS = {1 => 20, 2 => 35, 3 => 45, 4 => 60, 5=>0}

    def initialize
        super
        @name = "Ninja"
        @next_rank = RANKS[1]
    end
    
    def rank_up
        super
        @next_rank = RANKS[@rank]
    end
end