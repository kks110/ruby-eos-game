require 'forest'
require 'character'
require 'load_and_save'

class GameRunner

  attr_accessor :next_step_and_level, :data

  def self.run!
    load_file = new_game
    puts load_file

    player = Character.new
    @@data = {step: "wakeup", level: "Forest", character: player.name}
    LoadAndSave.filepath(@@data[:character])
    puts "There was an error reading the save file "unless LoadAndSave.file_check
    level_start
  end

  def self.new_game
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
          load_name = LoadAndSave.file_to_load
          return load_name
        else
          puts "That was not a valid option, please enter 1 or 2': "
        end
      end
    end
  end


  def self.level_start
    level = Object.const_get(@@data[:level])
    while @@data[:step] != "next_level" do
      @@data[:step], @@data[:level] = level.send(@@data[:step], @@data)
      LoadAndSave.save(@@data)
    end
  end






end
