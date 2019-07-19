require 'YAML'

module Save_Game
    def save_game(game_data)
      File.open("./save_data/saves/save.gsf", 'w') do |file| 
        file.write(game_data.to_yaml)
      end
    end
    def load_game(game_file)
      return YAML::load(File.read("./" + game_file))
    end
end