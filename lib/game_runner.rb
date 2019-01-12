require 'game_startup'
require 'forest'

# This holds the logic for running through the game.
# It loads the level files holds the loop to run through the logic.

class GameRunner

  attr_accessor :data

  # Runs the Game Start up, then run the level loop.
  def self.run!
    # @@data contains the next step, the current level, and the players name.
    @@data = GameStartup.run!
    level_start
  end

  # Starts the level
  def self.level_start
    # While is not the end of the game, do this.
    while @@data[:step] != "end" && @@data[:level] != "end"
      # Set level so it can be used to call the class.
      level = Object.const_get(@@data[:level])
      # While not the next level, run through the steps of this level.
      while @@data[:step] != "next_level" do
        # Each step will return the next step and the level.
        @@data[:step], @@data[:level] = level.send(@@data[:step], @@data)
        # It auto saves after each decision.
        LoadAndSave.save(@@data)
      end
      # Sets the next step from next_level to be the start point, and
      # starts the loop again with the @@data[:level] being the next one.
      if @@data[:step] == "next_level"
        @@data[:step] == "start_point"
      end
    end
  end






end
