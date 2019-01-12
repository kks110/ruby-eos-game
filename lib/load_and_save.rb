class LoadAndSave

  @@save_folder = File.join(APP_ROOT, 'save_games')

  def self.save_files?
    return true unless Dir.empty?(@@save_folder)
  end

  def self.filepath(player)
    @@filepath = File.join(APP_ROOT, 'save_games', player + "_save")
  end



  def self.file_check
    if file_usable?
      return true
    else
      make_file
      return true
    end
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.writable?(@@filepath)
    return false unless File.readable?(@@filepath)
    return true
  end

  def self.make_file
    file = File.open(@@filepath, 'w')
    file.close
    file_usable?
    return true
  end

  def self.name_check(name)
    name = name + "_save"
    files = Dir.entries(@@save_folder)
    files.each do |file_name|
      if name == file_name
        puts "File already exists with that name"
        puts "Would you like to load that file or overwrite it"
        puts "1 - Use"
        puts "2 - Overwrite"
        loop do
          answer = gets.chomp
          if answer == "1"
             return true
           elsif answer == "2"
             file = File.open(@@filepath, 'w')
             file.close
             return false
           else
             puts "You did not enter a valid option, please enter 1 or 2"
           end
         end
      end
    end
  end



  def self.file_to_load
    puts "Which save would you like to load?"
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
          puts "#{k}: #{v}"
        end
      end
      answer = gets.chomp.to_i
      if answer > 0 && answer <= counter_2
        @@filepath = File.join(APP_ROOT, 'save_games', file_hash[answer])
        return file_hash[answer]
      else
        puts "That is not a valid option. Please enter a number between 1 and #{counter_2-1}"
      end
    end
  end

  def self.load(file)
    lines = IO.readlines(@@filepath)
    save_data = lines.last.chomp
    save_data = eval(save_data)
    return save_data
  end



  def self.save(data)
    File.open(@@filepath, 'a') do |line|
      line << "#{[data].join("\t")}\n"
    end
  end


end
