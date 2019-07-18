require_relative "Freelancer"

class Onion_Knight < Freelancer
    def initialize
        super
        @next_rank = 999
        @name = "Onion Knight"
    end
    
    def rank_up
        @rank = 5
        #unlock moves
    end
end