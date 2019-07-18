require 'byebug'
require 'colorize'

class Jobs
    attr_reader :name, :rank
    RANK_STARS = {1=>"*", 2=>"**", 3=>"***", 4=>"****", 5=>"MASTERED"}

    def initialize
        @rank = 1
        @jp = 0
    end

    def earn_jp(jp)
        @jp += jp
        while !max_rank? && @jp >= @next_rank
            rank_up
        end
    end
    def rank_up
        @jp -= @next_rank
        @rank += 1
    end

    def max_rank?
        return @rank == 5
    end
    def rank?
        return @rank
    end

    def to_s
        output = "#{@name.ljust(15)}".colorize(:cyan)
        output += "#{RANK_STARS[@rank].ljust(5)}".colorize(:yellow)
        output += "(JP:#{@jp}/#{@next_rank})".colorize(:red) if @rank < 5
        return output
    end
end