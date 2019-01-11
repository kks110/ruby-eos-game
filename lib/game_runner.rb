require 'forest'
require 'character'
require 'load_and_save'

class GameRunner

  attr_accessor :next_step_and_level

  def self.run!
     puts "There was an error reading the save file "unless LoadAndSave.file_check
     # puts "Would you like to load a game, or start a new one?"
     # loop do
     #   puts "1 - New Game"
     #   puts "2 - Load Game"
     #   answer = gets.chomp
     #   if answer == "1"
     #     break
     #   elsif answer == "2"
     #     LoadAndSave.load
     #   else
     #     puts "That was not a valid option, please enter 1 or 2': "
     #   end
     # end
    player = Character.new
    @next_step_and_level = ["wakeup", "Forest"]
    level_start(player, @next_step_and_level)
  end



  def self.level_start(player, step_and_level)
    level = Object.const_get(step_and_level[1])
    while step_and_level[0] != "next_level" do
      step_and_level = level.send(step_and_level[0], player.name)
    end
    return step_and_level
  end





end
