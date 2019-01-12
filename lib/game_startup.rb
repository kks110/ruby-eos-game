require 'character'
require 'load_and_save'

class GameStartup

  attr_accessor :data

  def self.run!
    load_file = load_save?
    if load_file
      @@data = LoadAndSave.load(load_file)
      return @@data
    else
      new_game
    end
  end

  def self.new_game
    player = Character.new
    file = LoadAndSave.filepath(player.name)
    if LoadAndSave.name_check(player.name)
      @@data = LoadAndSave.load(file)
      return @@data
    end
    @@data = {step: "start_point", level: "Forest", character: player.name}
    puts "There was an error reading the save file "unless LoadAndSave.file_check
    return @@data
  end

  def self.load_save?
    if !LoadAndSave.save_files?
      return false
    else
      puts "Would you like to load a game, or start a new one?"
      loop do
        puts "1 - New Game"
        puts "2 - Load Game"
        answer = gets.chomp
        if answer == "1"
          return false
        elsif answer == "2"
          return LoadAndSave.file_to_load
        else
          puts "That was not a valid option, please enter 1 or 2': "
        end
      end
    end
  end




end
