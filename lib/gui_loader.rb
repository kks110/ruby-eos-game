# This draws the choices to the display.

require 'choice_checker'

class Gui

  # This sets up the default output setting
  @lines = '|' * 4
  @spaces = ' ' * 112
  @default_line = @lines + @spaces + @lines

  # First you send in the message to display the and options to pick.
  def self.gui_message_intake(message_array, options_array=[])
    @message_display = []
    @options_display = []
    # This then passes them to the line length check to make sure its an even amount of characters
    gui_line_length_check(message_array, 'message')
    gui_line_length_check(options_array, 'options')
    # This then goes to the writer to display the information. Passing in the options as well.
    return gui_writer(options_array)
  end

  # This takes the message array and checks that the line is an even amount of characters.
  # If its not, it adds a character to it.
  def self.gui_line_length_check(array, m_or_o)
    array_length = array.length
    array.each_with_index do |message, index|
      message_length = message.length
      # It then gets passed over to the line maker to make the line to display.
      if message_length % 2 == 0
        gui_line_maker(message, message_length, m_or_o, index)
      else
        message_length += 1
        message += ' '
        gui_line_maker(message, message_length, m_or_o, index)
      end
    end
  end

  # This takes the line, works out how long it is, then creates it and saves it to an array.
  def self.gui_line_maker(message, message_length, m_or_o, index)
    message_spaces = 112 - message_length
    message_spaces_halfs = message_spaces / 2
    options_spaces = 63 - message_length
    if m_or_o == 'message'
      @message_display << @lines + ' ' * message_spaces_halfs + message + ' ' * message_spaces_halfs + @lines
    else
      @options_display << @lines + ' ' * 45 + (index + 1).to_s + ' - ' + message + ' ' * options_spaces + @lines
    end
  end

  # This checks the array is an even amount of lines, if not, it adds a default line at the bottom.
  # This make sure its even, ready for when its drawn to the screen later.
  def self.gui_message_line_tidy
    if @message_display.length % 2 == 0
      @message_display << @default_line
    end
    if @options_display.length % 2 == 0
      @options_display << @default_line
    end
  end

  # This does the calculations to pass to the drawers to make sure there is always the same amount of lines on the screen.
  def self.lines_calcualtions
    message_stage = @message_display.length
    message_amount = (message_stage - 1) / 2
    options_stage = @options_display.length
    options_amount = (options_stage - 1) / 2
    return message_amount, options_amount
  end

  def self.gui_writer(options=[])
    loop do
      # This does a message check to make sure its an odd amount of lines.
      gui_message_line_tidy
      # Gets the line calcualtions to apply them.
      message_amount, options_amount = lines_calcualtions
      # Draws the lines at the top of the screen.
      120.times do |x|
        print '-'
      end
      60.times do |x|
        print '<>'
      end
      120.times do |x|
        print '-'
      end

      # Draws the top message display.
      (6 - message_amount).times do |x|
        print @default_line
      end

      @message_display.each do |message|
        print message
      end

      (7 - message_amount).times do |x|
        print @default_line
      end

      # raws the line in the middle of the screen.
      120.times do |x|
        print '-'
      end

      # Draws the options display.
      (4 - options_amount).times do |x|
        print @default_line
      end

      @options_display.each do |message|
        print message
      end

      (3 - options_amount).times do |x|
        print @default_line
      end

      # Draws the lines at the bottom of the screen.
      120.times do |x|
        print '-'
      end
      60.times do |x|
        print '<>'
      end
      120.times do |x|
        print '-'
      end
      # Adds a prompt, ready for user input.
      print '>> '
      # Grabs the answer.
      answer = gets.chomp.downcase.capitalize
      # Checks if it needs an answer. If no return compelte.
      if options == []
        return answer
      else
        # If yes, do a check to see if its valid.
        # If it is, pass it back.
        if ChoiceCheck.answer_check(answer, options)
          return ChoiceCheck.answer_check(answer, options)
        else
          @options_display << @lines + ' ' * 37 + 'Please enter one of the option numbers' + ' ' * 37 + @lines
        end
      end
    end
  end



end
