class ForestLogic

  # Player starts here, waking up in the forest.
  def self.wakeup(player_name)
    puts "You see the sun creeping through your closed eyes."
    gets
    puts "As you begin to open them, you realised you are no longer in your warm bed."
    gets
    puts "As you look around you see trees. How did you get here?"
    gets
    puts "You seem to be fully dressed."
    gets
    puts "'Come on #{player_name}, lets get up!' You think to yourself."
    gets
  end

  # The first decision, left or right.
  def self.left_or_right
    puts "You look around and see a path near by."
    gets
    puts "You cannot see any sign posts and you dont recognise the area"
    gets
    puts "You can either go left or right. Which way do you want to go?: "
    loop do
      puts "1 - Left"
      puts "2 - Right"
      l_or_r = gets.chomp
      # It will return what they pick to send them to the next step.
      if l_or_r == "1"
        return "left"
      elsif l_or_r == "2"
        return "right"
      else
        puts "That was not a valid option, please enter 1 or 2': "
      end
    end
  end

  # If they picked left, they are out, and are heading to the town.
  def self.left
    puts "You walk fruther and the trees begin to thin out."
    gets
    puts "You start to see buildings through the trees."
    gets
    puts "You emerge from the forest and before you is a town."
    puts "A signpost nearby points in two directions. One to the forst and says 'Rackstone Forest'"
    puts "The other to the town and says 'High Church'. You don't recognise either of these names"
    return "town"
  end

  # If not, their journey continues.
  def self.right
    puts "You start your journey along this road to see where it goes."
  end
end
