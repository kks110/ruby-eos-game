require 'gui_loader'

class Forest

  # Player starts here, waking up in the forest.
  def self.start_point(data)
    puts data
    message = []
    message[0] = "You see the sun creeping through your closed eyes."
    message[1] = "As you begin to open them, you realise you are no longer in your warm bed."
    message[2] = "As you look around you see trees. How did you get here?"
    message[3] = "You seem to be fully dressed."
    message[4] = "'Come on #{data[:character]}, lets get up!' you think."
    Gui.gui_message_intake(message)
    return "left_or_right", "Forest"
  end

  # The first decision, left or right.
  def self.left_or_right(data)
    message = []
    message[0] = "You look around and see a path near by."
    message[1] = "You cannot see any sign posts and you don't recognise the area."
    message[2] = "You can either go left or right."
    message[3] = "Which way do you go?: "
    options = []
    options[0] = "Left"
    options[1] = "Right"
    choice = Gui.gui_message_intake(message, options)
    return choice.downcase, "Forest"
  end

  # If they picked left, they are out, and are heading to the town.
  def self.left(data)
    message = []
    message[0] = "You walk fruther and the trees begin to thin out."
    message[1] = "You start to see buildings through the trees."
    message[2] = "You emerge from the forest and before you is a town."
    message[3] = "A signpost nearby points in two directions. One to the forest which says 'Rackstone Forest'"
    message[4] = "The other to the town which says 'High Church'. You don't recognise either of these names."
    Gui.gui_message_intake(message)
    # return "next_level", "Town"
    return "next_level", "Incomplete"
  end

  # If not, their journey continues. Deeper in to the forest they go.
  def self.right(data)
    message = []
    message[0] = "You start your journey along this road to see where it goes."
    message[1] = "As you continue, the forest seems to get thicker around you."
    message[2] = "Off to the side of the path, you see smoke rising. As you get closer you realise it's a house."
    message[3] = "You come closer to the front of the house."
    options = []
    options[0] = "Walk past"
    options[1] = "Walk up and knock on the door"
    choice = Gui.gui_message_intake(message, options)
    if choice == "Walk past"
      choice = "go_past"
    else
      choice = "knock"
    end
    return choice, "Forest"
  end


  def self.go_past(data)
    message = []
    message[0] = "You journey deeper into the forest."
    message[1] = "The trees continue to close in around you."
    message[2] = "Less and less light is coming through the canopy above."
    Gui.gui_message_intake(message)
    # return "next_level", "deep_forest"
    return "next_level", "Incomplete"
  end

  def self.knock(data)
    message = []
    message[0] = "You knock on the door, no one answers."
    message[1] = "You knock again and still no answer."
    message[2] = "You can't hear anyone moving around."
    options = []
    options[0] = "Walk away"
    options[1] = "Try opening the door"
    choice = Gui.gui_message_intake(message, options)
    if choice == "Walk away"
      choice = "go_past"
    else
      choice = "open_door"
    end
    return choice, "Forest"
  end

  def self.open_door(data)
    message = []
    message[0] = "The door opens."
    options = []
    options[0] = "Walk away"
    options[1] = "Go in"
    choice = Gui.gui_message_intake(message, options)
    if choice == "Walk away"
      choice = "go_past"
    else
      choice = "go_in"
    end
    return choice, "Forest"
  end

def self.go_in(data)
  message = []
  message[0] = "As you walk in you smell food cooking."
  message[1] = "You look around and you can't see anyone."
  message[2] = "You shout 'Hello?' but there is no response."
  message[3] = "You see that food was being prepared as there is a knife and chopped vegetables on the table."
  message[4] = "You don't remember the last time you ate."
  message[5] = "You hear someone approaching the house."
  options = []
  options[0] = "Hide"
  options[1] = "Say hello?"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Hide"
    choice = "hide"
  else
    choice = "say_hello"
  end
  return choice, "Forest"
end

def self.say_hello(data)
  message = []
  message[0] = "A man enters holding an axe in one hand and wood in the other."
  message[1] = "'Hello' he replies, 'Who are you?'."
  message[2] = "He adjusts the axe."
  options = []
  options[0] = "Attack with chopping knife"
  options[1] = "Explain the situation"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Attack with chopping knife"
    choice = "attack"
  else
    choice = "explain"
  end
  return choice, "Forest"
end

def self.hide(data)
  message = []
  message[0] = "You dive under the table and try to keep yourself hidden."
  message[1] = "He puts the axe in the corner, and adds the wood to the stove."
  message[2] = "He starts chopping on the table above you."
  options = []
  options[0] = "Try and sneak out"
  options[1] = "Stay hidden"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Try and sneak out"
    choice = "sneak"
  else
    choice = "stay"
  end
  return choice, "Forest"
end

def self.sneak(data)
  message = []
  message[0] = "You try to creep out."
  message[1] = "Unfortunately, your sneaking skills were not as good as you hoped."
  Gui.gui_message_intake(message)
  return "caught", "Forest"
end

def self.stay(data)
  message = []
  message[0] = "You stay under the table."
  message[1] = "As he chops he knocks something onto the floor."
  message[2] = "It rolls under the table towards you."
  message[3] = "The man bends down to pick it up."
  message[4] = "He spots you so you jump out from under the table."
  Gui.gui_message_intake(message)
  return "caught", "Forest"
end

def self.caught(data)
  message = []
  message[0] = "The man looks at you, weilding the chopping knife"
  message[1] = "'Who are you and what were you doing under my table!?'"
  message[2] = "You see the axe sitting in the corner of the room."
  options = []
  options[0] = "Grab the axe and attack"
  options[1] = "Explain the situation"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Grab the axe and attack"
    choice = "attack"
  else
    choice = "explain"
  end
  return choice, "Forest"
end

def self.attack(data)
  message = []
  message[0] = "You dive for the weapon."
  message[1] = "You lunge towards the man."
  message[2] = "He dodges you easily then smacks you across the face."
  message[3] = "You collapse to the floor and fall unconscious."
  Gui.gui_message_intake(message)
  return "start_point", "Forest"
end

def self.explain(data)
  message = []
  message[0] = "'My name is #{data[:character]}, I woke up in the forest."
  message[1] = "I don't know where I am or where I'm going."
  message[2] = "I'm looking for help.''"
  message[3] = " "
  message[4] = "He replies, 'I'm Stor, you gave me a bit of a fright."
  message[5] = "It's getting dark and it can be dangerous out there."
  message[6] = "You can stay here for food and a bed for the night if you want?'"
  options = []
  options[0] = "Stay for the night"
  options[1] = "Refuse"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Stay for the night"
    choice = "stay_night"
  else
    choice = "refuse"
  end
  return choice, "Forest"
end

def self.refuse(data)
  message = []
  message[0] = ''"No, I'm sorry I broke into your house."
  message[1] = "I'll leave now.''"
  message[2] = "You can either go back the way you came, or carry on the way you were going."
  options = []
  options[0] = "Back the way you came from"
  options[1] = "Carry on"
  choice = Gui.gui_message_intake(message, options)
  if choice == "Back the way you came from"
    choice = "left"
  else
    choice = "go_past"
  end
  return choice, "Forest"
end

def self.stay_night(data)
  message = []
  message[0] = "'Food would be very appreciated'"
  message[1] = " "
  message[2] = "Stor offers you a seat at the table."
  message[3] = "He explains the forest is dangerous."
  message[4] = "He recommends you go back the way you came to avoid the perils of the forest."
  message[5] = "You eat and sleep well."
  message[6] = "You prepare yourself to leave."
  message[7] = "You can either go back the way you came, or carry on the way you were going."
  options = []
  options[0] = "Go back the way you came (Recommended by Stor)"
  options[1] = "Carry on"
  choice = Gui.gui_message_intake(message, options)
  puts choice
  if choice == "Go back the way you came (recommended by stor)"
    choice = "left"
  else
    choice = "go_past"
  end
  return choice, "Forest"
end

end
