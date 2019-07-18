require_relative "Jobs"

class Freelancer < Jobs
    RANKS = {1 => 10, 2 => 20, 3 => 30, 4 => 60} 

    def initialize
        super
        @name = "Freelancer"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end