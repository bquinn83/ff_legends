require_relative "Jobs"

class White_Mage < Jobs
    RANKS = {1 => 20, 2 => 35, 3 => 45, 4 => 60, 5=>0}
    POSITION = 10
    def initialize
        super
        @name = "White Mage"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end