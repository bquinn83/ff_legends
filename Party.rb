require "byebug"
require 'colorize'

class Party
    @@standby_exp = false
    @@standby_jp = false

    def initialize(max_party, standby_exp = 0.25, standby_jp = 0.2)
        @max_party = max_party
        @active_party = Array.new
        @standby_party = Array.new

        @standby_exp = standby_exp
        @standby_jp = standby_jp
    end

    #Add new character to the party
    def add_character(character)
        if @active_party.length < @max_party
            @active_party << character
        else
            @standby_party << character
        end
    end

    #Give party experience
    def reward_experience(exp, jp)
        @active_party.each do |character| 
            character.earn_experience(exp)
            character.earn_jp(jp)
        end
        @standby_party.each do |character|
            character.earn_experience((exp * @standby_exp).to_i) if @@standby_exp
            character.earn_jp((jp * @standby_jp).to_i) if @@standby_jp
        end
    end
    
    #Output Active & Standby party characters
    def to_s
        output = "\nActive party:".on_red
        @active_party.each{|character| output += "\n#{character}"}
        if @standby_party.length > 0
            output += "\nStandby party:".on_magenta
            @standby_party.each{|character| output += "\n#{character}"}
        end
        return output
    end

    #Toggle Party settings
    def self.toggle_standby_exp
        if @@standby_exp == false
            @@standby_exp = true
        else
            @@standby_exp = false
        end
    end
    def self.toggle_standby_jp
        if @@standby_jp == false
            @@standby_jp = true
        else
            @@standby_jp = false
        end
    end
end