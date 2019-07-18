require 'byebug'
require 'colorize'

#require Jobs class files
    require "./jobs/Jobs.rb"
    require_relative "./jobs/Freelancer.rb"
    require_relative "./jobs/Onion_Knight.rb"
    require_relative "./jobs/Warrior.rb"
    require_relative "./jobs/Knight.rb"
    require_relative "./jobs/Thief.rb"
    require_relative "./jobs/Monk.rb"
    require_relative "./jobs/Ninja.rb"
    require_relative "./jobs/White_Mage.rb"
    require_relative "./jobs/Time_Mage.rb"
    require_relative "./jobs/Black_Mage.rb"
    require_relative "./jobs/Summoner.rb"
    require_relative "./jobs/Red_Mage.rb"
#end of Jobs class files

#require Moves class files
#end of Moves class files

class Character
    attr_reader :name, :jobs, :current_job

    @@show_stats = false
    @@show_jobs = false

    #TO-DO: Adjust levels...
    LEVELS = Hash.new(1600)
  
    def initialize(name, hp = 150, mp = 40)
        @active = false
        @name = name
        @level = 1
        @experience = 0
        #set health/mp stats
        @hp_max = hp
        @hp = hp
        @mp_max = mp
        @mp = mp
        #create & load @jobs hash w/ Freelancer & set to @current_job
        @jobs = {Freelancer: Freelancer.new}
        @current_job = :Freelancer
    end

#Experience Methods
    def earn_experience(exp)
        @experience += exp
        while @experience >= LEVELS[@level] && @level != 99
            level_up
            level_up_hp
            level_up_mp
        end
    end
    def level_up
        @experience -= LEVELS[@level]
        @level += 1
    end
    def level_up_hp
        hp_increase = (@level % 10) * @level / 10 + 1 * (rand(100) +1)
        @hp += hp_increase
        @hp_max += hp_increase
    end
    def level_up_mp
        mp_increase = ((@level % 10) * @level / 10 + 1 * (rand(100) +1)) / 10
        @mp += mp_increase
        @mp_max += mp_increase
    end

#JP, Rank & Job Methods
    def earn_jp(jp)
        @jobs[@current_job].earn_jp(jp)
        unlock_advanced_job
    end
    def unlock_advanced_job
        if @jobs[@current_job].rank? == 5
            case @current_job
            when :Freelancer
                @jobs = @jobs.to_a.insert(@jobs.keys.index(:Freelancer) + 1, {Onion_Knight: Onion_Knight.new}.first).to_h
            when :Warrior
                @jobs = @jobs.to_a.insert(@jobs.keys.index(:Warrior) + 1, {Knight: Knight.new}.first).to_h
            when :Monk
                @jobs = @jobs.to_a.insert(@jobs.keys.index(:Monk) + 1, {Ninja: Ninja.new}.first).to_h
            when :White_Mage
                @jobs = @jobs.to_a.insert(@jobs.keys.index(:White_Mage) + 1, {Time_Mage: Time_Mage.new}.first).to_h
                if @jobs[:Black_Mage].rank? == 5 && !@jobs.has_key?(:Red_Mage)
                    #@jobs = @jobs.to_a.insert(@jobs.keys.index(:Black_Mage) + 1, {Red_Mage: Red_Mage.new}.first).to_h
                    @jobs[:Red_Mage] = Red_Mage.new
                end
            when :Black_Mage
                @jobs = @jobs.to_a.insert(@jobs.keys.index(:Black_Mage) + 1, {Summoner: Summoner.new}.first).to_h
                if @jobs[:White_Mage].rank? == 5 && !@jobs.has_key?(:Red_Mage)
                    #@jobs = @jobs.to_a.insert(@jobs.keys.index(:Black_Mage) + 1, {Red_Mage: Red_Mage.new}.first).to_h
                    @jobs[:Red_Mage] = Red_Mage.new
                end
            end
        end
    end

    def add_job(name, job)
        @jobs[name] = job
    end
    def change_job(job_key)
        @current_job = job_key
    end

#class methods
    def to_s
        output = "-#{@name}, Lvl:#{@level}"
        if @@show_stats
            output += "\n".ljust(4) + "HP:#{@hp}/#{@hp_max}".colorize(:green)
            output += "\n".ljust(4) + "MP:#{@mp}/#{@mp_max}".colorize(:blue)
            output += "\n".ljust(4) + "EXP:#{@experience}/#{LEVELS[@level]}".colorize(:yellow)
            
        end
        if @@show_jobs
            @jobs.each_value do |job|
                output += "\n"
                output += "".rjust(5) + "=>"  if job == @jobs[@current_job]
                output += "\t#{job}" #if job.isActive?
            end
        end
        return output + "\n"
    end
    def self.toggle_stats
        if @@show_stats == false
             @@show_stats = true
        else
            @@show_stats = false
        end
    end
    def self.toggle_jobs
        if @@show_jobs == false
            @@show_jobs = true
        else
            @@show_jobs = false
        end
    end

end