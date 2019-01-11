require 'forest'
require 'character'

class GameRunner

  attr_accessor :level

  # Starts the game.
  def self.run!
    # Get the player name.
    player = Character.new

    # Sets the first level.
    @next_step_and_level = ["wakeup", "Forest"]

    # Starts the logic loop
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
