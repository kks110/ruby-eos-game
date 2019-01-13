APP_ROOT = File.dirname(__FILE__)
$:.unshift( File.join(APP_ROOT, 'lib'))
require 'gui_loader'

def self.left_or_right
  message = []
  message[0] = "You look around and see a path near by."
  message[1] = "You cannot see any sign posts"
  message[2] = "and you don't recognise the area"
  message[3] = "You can either go left or right."
  message[4] = "Which way do you go?: "
  options = []
  options[0] = "Left"
  options[1] = "Right"
  choice = Gui.gui_message_intake(message, options)
  puts choice, "Forest"
end

left_or_right
