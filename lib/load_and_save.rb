
# This file deals with all things IO realted.
# It stores the save folders / filepaths.
# Any checks of the file / folder and any writing / reading from the save files is done here.

require 'gui_loader'

class LoadAndSave

  # Sets the save folder path.
  @@save_folder = File.join(APP_ROOT, 'save_games')

  # Checks the directory to see if there are any save files.
  def self.save_files?
    return true unless Dir.empty?(@@save_folder)
  end

  # Counts the amount of save files, then asks to load or delete one if over 6.
  def self.save_file_amount?
    amount = Dir.entries(@@save_folder)
    amount = amount.length - 2
    if amount >= 6
      message = []
      options = []
      message[0] = "You have reached your maximum amount of save files."
      message[1] = "If you want to start a new game, you will have to overwrite one"
      message[2] = "Would you like to delete one or load one?"
      options[0] = "Overwrite"
      options[1] = "Load"
      answer = Gui.gui_message_intake(message, options)
      if answer == "1" || answer == "Overwrite"
        self.delete
        return false
      else
        return true
      end
    end
  end

  # Sets the save files based on aplyer name.
  def self.filepath(player)
    @@filepath = File.join(APP_ROOT, 'save_games', player + ".save")
  end

  # Checks if the file exists and is usable, if not creates it.
  def self.file_check
    if file_usable?
      return true
    else
      make_file
      return true
    end
  end

  # The logic to check if its usable.
  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.writable?(@@filepath)
    return false unless File.readable?(@@filepath)
    return true
  end

  # The logic to make the file.
  def self.make_file
    file = File.open(@@filepath, 'w')
    file.close
    file_usable?
    return true
  end

  # This checks if the save file already exists.
  # IF it does, it asks if the player wants to load the save file,
  # or if they want to overwrite it.
  def self.name_check(name)
    name = name + ".save"
    files = Dir.entries(@@save_folder)
    files.each do |file_name|
      if name == file_name
        message = []
        options = []
        message[0] = "File already exists with that name"
        message[1] = "Would you like to load that file or overwrite it"
        options[0] = "Use"
        options[1] = "Overwrite"
        loop do
          answer = Gui.gui_message_intake(message, options)
          if answer == "1" || answer == "Use"
             return true
           else answer == "2" || answer == "Overwrite"
             file = File.open(@@filepath, 'w')
             file.close
             return false
          end
        end
      end
    end
    return false
  end

  # Gets a list of save files names and returns as an array.
  def self.list_of_filenames
    options = []
    files = Dir.entries(@@save_folder)
    files_count = files.length
    counter_1 = 0
    counter_2 = -1
    file_hash = {}
    files_count.times do
      file_hash[counter_2] = files[counter_1]
      counter_1 += 1
      counter_2 += 1
    end
    loop do
      file_hash.each do |k, v|
        if k >= 1
          options << "#{v}"
        end
      end
      return options
    end
  end

  # Asks which file to be deleted then deletes it.
  def self.delete
    message = []
    options = []
    options = list_of_filenames
    message[0] =  "Which save would you like to delete?"
    answer = Gui.gui_message_intake(message, options)
    fillepath = File.join(APP_ROOT, 'save_games', answer)
    File.delete(fillepath)
  end

  # This displays the list of files that can be loaded from.
  # The user then picks which one to load.
  # Dir.entries also returns the . and .. so had to work around that a bit.
  # Tried to do an if to skip those, but couldn't get it working.
  # Instead it uses 2 counters to name them -1 and 0, then only displays from 1 up.
  def self.file_to_load
    message = []
    options = []
    options = list_of_filenames
    message[0] =  "Which save would you like to load?"
    answer = Gui.gui_message_intake(message, options)
    @@filepath = File.join(APP_ROOT, 'save_games', answer)
    return answer
  end

  # Loads the file selected, and takes the last line from it.
  # The lines are saved as hashes, so just evals the string to a hash and passes it back.
  def self.load(file)
    lines = IO.readlines(@@filepath)
    save_data = lines.last.chomp
    save_data = eval(save_data)
    return save_data
  end


  # Gets passed in the data hash or next step, level and player name and appends it to the file.
  def self.save(data)
    File.open(@@filepath, 'a') do |line|
      line << "#{[data].join("\t")}\n"
    end
  end


end
