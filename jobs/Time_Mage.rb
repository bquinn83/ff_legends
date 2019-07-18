require_relative "White_Mage"

class Time_Mage < White_Mage
    RANKS = {1 =>10, 2 =>30, 3 =>55, 4=>80, 5=>0}
    POSITION = 11
    def initialize
        super
        @name = "Time Mage"
        @next_rank = RANKS[1]
    end

    def rank_up
        super
        @next_rank = RANKS[@rank]
        #unlock moves
    end
end