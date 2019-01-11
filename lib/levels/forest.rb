
class Forest

  def self.wakeup(player_name)
    puts "You see the sun creeping through your closed eyes."
    gets
    puts "As you begin to open them, you realised you are no longer in your warm bed."
    gets
    puts "As you look around you see trees. How did you get here?"
    gets
    puts "You seem to be fully dressed."
    gets
    puts "Come on #{player_name}, lets get up! You think to yourself."
    gets
  end

  def self.decision
    puts "You look around and see a path near by."
    gets
    puts "You cannot see any sign posts and you dont recognise the area"
    gets
    puts "You can either go left or right. Which way do you want to go?: "
    loop do
      puts "1 - Left"
      puts "2 - Right"
      l_or_r = gets.chomp
      if l_or_r == "1"
        return "forest_left"
      elsif l_or_r == "2"
        return "forest_right"
      else
        puts "That was not a valid option, please enter 1 or 2': "
      end
    end
  end
end
