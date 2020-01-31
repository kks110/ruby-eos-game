require 'gui_loader'

class Forest

  # Player starts here, waking up in the forest.
  def self.start_point(data)
    message = [
        'You wake up groggily, arms stretched out to grasp the duve- wait, you have no duvet!',
        'Yu realise you are no longer in your warm bed, but are instead surrounded by thick trees in a sunlit forest',
        'You look around at the towering trees, and think to yourself "How did I get here?"?',
        'You glance down and see that you are dressed in your normal clothes - a casual t shirt, some brown trousers and comfortable shoes',
        "You hear a rustle from nearby, and nervously think to yourself ' #{data[:character]}, you'd better get moving!'"
    ]
    Gui.gui_message_intake(message)
    ['left_or_right', 'Forest']
  end

  # The first decision, left or right.
  def self.left_or_right(data)
    message = [
        'You nervously look around, and see that there is a path that could lead you either left or right',
        'To the left you see the trees narrowing into what looks to be a small town',
        'To the right you see the trees thickening, and smoke rising from what could be a small fire or cottage',
        'Which way do you go?: '
    ]
    options = %w(Left Right)
    choice = Gui.gui_message_intake(message, options)
    [choice.downcase, 'Forest']
  end

  # If they picked left, they are out, and are heading to the town.
  def self.left(data)
    message = [
        'You decide to go left, the thought of a town and civilization appealing to you',
        'You think to yourself that you might finally be able to get a change of clothes at a town!',
        'Emerging from the trees, you find yourself in the shadow of a mighty stone keep.',
        "Flags you don't recognise fly from the parapets, and you realise that you are a long way from home.",
        'You look around before spotting a signpost that may give you some clarity on where you are...',
        'The signpost simply says "NorthWatch"',
    ]
    Gui.gui_message_intake(message)
    # return "next_level", "Town"
    ['next_level', 'Incomplete']
  end

  # If not, their journey continues. Deeper in to the forest they go.
  def self.right(data)
    message = [
        "Your stomach rumbles, and it feels like you haven't eaten in a long time. You make your way towards the fire in the hope that there is something to eat. ",
        'As you continue, the forest seems to thicken, and the trees seem to block the light, unnerving you as you walk further and further in',
        "To your delight, however, the smoke seems to be getting closer. You move forward past a clearing and see a beautifully thatched old cottage",
        'What do you do?'
    ]
    options = ['Walk past', 'Walk up and knock on the door']
    response = Gui.gui_message_intake(message, options)
    choice = if response == 'Walk past'
               'go_past'
             else
               'knock'
             end
    [choice, 'Forest']
  end


  def self.go_past(data)
    message = [
        "'You look wantonly at the cottage, but your deep-rooted sense of mistrust makes you decide that you can't risk a strangers charity, so you continue on",
        'With each step the forest gets thicker and thicker, until the branches of the towering trees almost completely block out the sun',
        'You start moving a lot slower, stumbling over upturned roots and stray branches',
        'You turn back the way you came, but to your horror find yourself staring at an infinite path, nothing like where you have come from'
    ]
    Gui.gui_message_intake(message)
    # return "next_level", "deep_forest"
    ['next_level', 'Incomplete']
  end

  def self.knock(data)
    message = [
        'You knock on the door, no one answers.',
        'You knock again and still no answer.',
        "You can't hear anyone moving around."
    ]
    options = ["Walk away", "Try opening the door"]
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Walk away"
               "go_past"
             else
               "open_door"
             end
    [choice, 'Forest']
  end

  def self.open_door(data)
    message = ['The door opens.']
    options = ['Walk away', 'Go in']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Walk away"
               "go_past"
             else
               "go_in"
             end
    [choice, 'Forest']
  end

  def self.go_in(data)
    message = [
        'As you walk in you smell food cooking.',
        "You look around and you can't see anyone.",
        "You shout 'Hello?' but there is no response.",
        'You see that food was being prepared as there is a knife and chopped vegetables on the table.',
        "You don't remember the last time you ate.",
        'You hear someone approaching the house.'
    ]
    options = ['Hide', 'Say hello?']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Hide"
               "hide"
             else
               "say_hello"
             end
    [choice, 'Forest']
  end

  def self.say_hello(data)
    message = [
        'A man enters holding an axe in one hand and wood in the other.',
        "'Hello' he replies, 'Who are you?'.",
        'He adjusts the axe.'
    ]
    options = ['Attack with chopping knife', 'Explain the situation']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Attack with chopping knife"
               "attack"
             else
               "explain"
             end
    [choice, 'Forest']
  end

  def self.hide(data)
    message = [
        'You dive under the table and try to keep yourself hidden.',
        'He puts the axe in the corner, and adds the wood to the stove.',
        'He starts chopping on the table above you.'
    ]
    options = ['Try and sneak out', 'Stay hidden']
    response = Gui.gui_message_intake(message, options)
    choice = if response == 'Try and sneak out'
               'sneak'
             else
               'stay'
             end
    [choice, 'Forest']
  end

  def self.sneak(data)
    message = [
        'You try to creep out.',
        'Unfortunately, your sneaking skills were not as good as you hoped.'
    ]
    Gui.gui_message_intake(message)
    ['caught', 'Forest']
  end

  def self.stay(data)
    message = [
        'You stay under the table.',
        'As he chops he knocks something onto the floor.',
        'It rolls under the table towards you.',
        'The man bends down to pick it up.',
        'He spots you so you jump out from under the table.'
    ]
    Gui.gui_message_intake(message)
    ['caught', 'Forest']
  end

  def self.caught(data)
    message = [
        'The man looks at you, wielding the chopping knife',
        "'Who are you and what were you doing under my table!?'",
        'You see the axe sitting in the corner of the room.'
    ]
    options = ['Grab the axe and attack', 'Explain the situation']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Grab the axe and attack"
               "attack"
             else
               "explain"
             end
    [choice, 'Forest']
  end

  def self.attack(data)
    message = [
        'You dive for the weapon.',
        'You lunge towards the man.',
        'He dodges you easily then smacks you across the face.',
        'You collapse to the floor and fall unconscious.'
    ]
    Gui.gui_message_intake(message)
    ['start_point', 'Forest']
  end

  def self.explain(data)
    message = [
        "'My name is #{data[:character]}, I woke up in the forest.",
        "I don't know where I am or where I'm going.",
        "I'm looking for help.'",
        ' ',
        "He replies, 'I'm Stor, you gave me a bit of a fright.",
        "It's getting dark and it can be dangerous out there.",
        "You can stay here for food and a bed for the night if you want?'"
    ]
    options = ['Stay for the night', 'Refuse']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Stay for the night"
               "stay_night"
             else
               "refuse"
             end
    [choice, 'Forest']
  end

  def self.refuse(data)
    message = [
        "'No, I'm sorry I broke into your house.",
        "I'll leave now.'",
        'You can either go back the way you came, or carry on the way you were going.'
    ]
    options = ['Back the way you came from', 'Carry on']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Back the way you came from"
               "left"
             else
               "go_past"
             end
    [choice, 'Forest']
  end

  def self.stay_night(data)
    message = [
        "'Food would be very appreciated'",
        ' ',
        'Stor offers you a seat at the table.',
        'He explains the forest is dangerous.',
        'He recommends you go back the way you came to avoid the perils of the forest.',
        'You eat and sleep well.',
        'You prepare yourself to leave.',
        'You can either go back the way you came, or carry on the way you were going.'
    ]
    options = ['Go back the way you came (Recommended by Stor)', 'Carry on']
    response = Gui.gui_message_intake(message, options)
    choice = if response == "Go back the way you came (recommended by stor)"
               "left"
             else
               "go_past"
             end
    [choice, 'Forest']
  end

end
