require 'forest'
require 'character'

class GameRunner

  attr_accessor :level

  # Starts the game.
  def self.run!
    # Get the player name.
    player = Character.new
    # Sets the first level.
    @level = "forest"
    # Starts the game at the first level.
    self.send(@level, player)
  end

  # The journey begins. In to the forest.
  def self.forest(player)
    # Sets the level = to what is returned from the forest
    # to see where the player goes next.
    @level = Forest.run!(player)

    # This will send the player to the next level once its written. 
    # self.send(@level, player)
  end





end
