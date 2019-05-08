require 'load_and_save'
require 'gui_loader'
# Basic set up of player to get their name.

class Character
  attr_accessor :name

  def initialize
    message = []
    message[0] = 'Welcome, what is your name?: '
    name = Gui.gui_message_intake(message)
    @name = name.downcase.capitalize
  end

end