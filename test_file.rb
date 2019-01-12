APP_ROOT = File.dirname(__FILE__)
$:.unshift( File.join(APP_ROOT, 'lib'))
require 'gui_loader'

def self.left_or_right
  Gui.messages_gui_writer("You look around and see a path near by.")
  gets
  Gui.messages_gui_writer("You cannot see any sign posts")
  gets
  Gui.messages_gui_writer("and you don't recognise the area")
  gets
  Gui.messages_gui_writer("You can either go left or right.")
  gets
  Gui.messages_gui_writer("Which way do you go?: ")
end

left_or_right
