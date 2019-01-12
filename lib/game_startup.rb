require 'character'
require 'load_and_save'

# This file takes care of setting up the game when it first runs.
# It will check if you want to start a new game, or load one.

class GameStartup

  attr_accessor :data

  # First checks is there is a file to load or a first run of the game.
  def self.run!
    load_file = load_save?
    if load_file
      @@data = LoadAndSave.load(load_file)
      # If there is it will return the saved data is necessary.
      return @@data
    else
      # Or start the new game function.
      new_game
    end
  end

  # The new game will ask the player for the character, and will
  # do some checkes to see if there is already a player with that name.
  # Will also create the save file.
  def self.new_game
    player = Character.new
    file = LoadAndSave.filepath(player.name)
    if LoadAndSave.name_check(player.name)
      # If there is a player / save with that name, it will ask if you want to load it.
      @@data = LoadAndSave.load(file)
      return @@data
    end
    # If not, it will set up the first level data, create
    # and check the save data, and return it to the game runner.
    @@data = {step: "start_point", level: "Forest", character: player.name}
    puts "There was an error reading the save file "unless LoadAndSave.file_check
    return @@data
  end

  # If it find a save file, it will ask if you want to load a save file
  # or start a new game.
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
