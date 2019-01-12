
class Gui


  @@lines = "|" * 4
  @@spaces = " " * 54
  @@default_line = @@lines + @@spaces + @@lines + @@spaces + @@lines



  def self.messages_gui_writer(message="")
    message_length = message.length
    if message_length % 2 == 0
    else
      message_length += 1
      message += " "
    end
    message_spaces = 54 - message_length
    message_spaces_halfs = message_spaces / 2
    message_line = @@lines + " " * message_spaces_halfs + message + " " * message_spaces_halfs + @@lines + @@spaces + @@lines
    120.times do |x|
      print "-"
    end
    puts
    120.times do |x|
      print "-"
    end
    11.times do |x|
      print @@default_line
    end
    1.times do |x|
      print message_line
    end
    11.times do |x|
      print @@default_line
    end
    120.times do |x|
      print "-"
    end
    puts
    120.times do |x|
      print "-"
    end
end


end
