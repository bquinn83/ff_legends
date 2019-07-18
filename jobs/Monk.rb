require_relative "Jobs"

class Monk < Jobs
    RANKS = {1 => 30, 2 => 30, 3 => 30, 4 => 30, 5=>0}
    def initialize
        super
        @name = "Monk"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end