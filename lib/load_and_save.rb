class LoadAndSave

  @@filepath = File.join(APP_ROOT, 'save_games', 'saves.txt')

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

  def self.load(name)
  end

  def self.delete(name)
  end


end
