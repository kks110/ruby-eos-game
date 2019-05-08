require 'character'
require 'load_and_save'
require 'gui_loader'

# This file takes care of setting up the game when it first runs.
# It will check if you want to start a new game, or load one.

class GameStartup

  attr_accessor :data

  # First checks is there is a file to load or a first run of the game.
  # Also confirms that the save folder exists.
  def self.run!
    LoadAndSave.save_folder?
    load_file = load_save?
    if load_file
      data = LoadAndSave.load
      # If there is it will return the saved data is necessary.
      return data
    else
      # Or start the new game function.
      new_game
    end
  end

  # The new game will ask the player for the character, and will
  # do some checkes to see if there is already a player with that name.
  # Will also create the save file.
  # I have put in a 6 file max limit, so will check and see if there are 6 save files as well.
  def self.new_game
    if LoadAndSave.save_file_amount?
      file = LoadAndSave.file_to_load
      data = LoadAndSave.load(file)
      return data
    end
    player = Character.new
    file = LoadAndSave.filepath(player.name)
    if LoadAndSave.name_check(player.name)
      # If there is a player / save with that name, it will ask if you want to load it.
      data = LoadAndSave.load
      return data
    end
    # If not, it will set up the first level data, create
    # and check the save data, and return it to the game runner.
    data = {step: "start_point", level: "Forest", character: player.name}
    puts "There was an error reading the save file" unless LoadAndSave.file_check
    return data
  end

  # If it find a save file, it will ask if you want to load a save file
  # Also had the option to delete the save files. If you delete all of them it will start a new game.
  # or start a new game.
  def self.load_save?
    while LoadAndSave.save_files?
    message = []
    options = []
    message[0] = "Would you like to load a game, or start a new one?"
    options[0] = "New Game"
    options[1] = "Load Game"
    options[2] = "Delete save"
    answer = Gui.gui_message_intake(message, options)
      if answer == "1" || answer == "New game"
        return false
      elsif answer == "2" || answer == "Load game"
        return LoadAndSave.file_to_load
      else
        LoadAndSave.delete
      end
    end
  end




end
