require_relative "Jobs"

class Thief < Jobs
    RANKS = {1 => 15, 2 => 20, 3 => 40, 4 => 60, 5=>0}
    def initialize
        super
        @name = "Thief"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end