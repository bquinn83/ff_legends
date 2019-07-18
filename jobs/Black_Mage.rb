require_relative "Jobs"

class Black_Mage < Jobs
    RANKS = {1 => 40, 2 => 40, 3 => 40, 4 => 100, 5=>0}
    POSITION = 11
    def initialize
        super
        @name = "Black Mage"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end