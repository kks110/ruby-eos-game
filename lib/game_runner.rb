require 'forest'
require 'character'
require 'load_and_save'

class GameRunner

  attr_accessor :next_step_and_level, :data

  def self.run!
    load_file = load_save?
    if load_file
      @@data = LoadAndSave.load(load_file)
      level_start
    else
      new_game
    end
  end

  def self.new_game
    player = Character.new
    file = LoadAndSave.filepath(player.name)
    if LoadAndSave.name_check(player.name)
      @@data = LoadAndSave.load(file)
      level_start
    end
    @@data = {step: "wakeup", level: "Forest", character: player.name}
    puts "There was an error reading the save file "unless LoadAndSave.file_check
    level_start
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
