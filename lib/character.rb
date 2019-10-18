require 'load_and_save'
require 'gui_loader'
# Basic set up of player to get their name.

class Character
  attr_accessor :name

  def initialize
    message = []
    message[0] = 'Welcome, what is your name?: '
    player_name = ''
    player_name = Gui.gui_message_intake(message) while player_name == ''
    @name = player_name.downcase.capitalize
  end
end