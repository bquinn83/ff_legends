require_relative "Jobs"

class Red_Mage < Jobs
    RANKS = {1=>100, 2=>200, 3=>300, 4=>400, 5=>500}
    POSITION = 13
    def initialize
        super
        @name = "Red Mage"
        @next_rank = RANKS[1]
    end
    
    def rank_up
        super
        @next_rank = RANKS[@rank]
    end
end