require 'forest_logic'

class Forest

  attr_accessor :forest_complete

  # Will to be used to keep track of when the level is complete
  # and where to send the player to next.
  @forest_complete = "forest"

  # Calls the forest logic.
  def self.run!(player)
    # The forest logic will return a word if the player leaves the forest.
    # That will be used to break the loop and send the player back to the game_runner
    while @forest_complete == "forest" do
      # Start up in the forest.
      ForestLogic.wakeup(player.name)

      # Player makes their first decision. To go left or right.
      forest_decision = ForestLogic.left_or_right

      # The result of this decision could complete this loop here, or send them fruther in to the forest.
      # If they exit at this point, it will return "town" as the next location.
      @forest_complete = ForestLogic.send(forest_decision)


    end
    # Will return the next location, so the game knows where it needs to go next.
    return @forest_complete
  end

end
