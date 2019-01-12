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
        puts "Loading file"
        return file_hash[answer]
      else
        puts "That is not a valid option. Please enter a number between 1 and #{counter_2-1}"
      end
    end
  end

  def self.delete(name)
  end

  def self.save(data)
    File.open(@@filepath, 'a') do |line|
      line << "#{[data].join("\t")}\n"
    end
  end


end
