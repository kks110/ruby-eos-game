require 'game_startup'
require 'forest'


class GameRunner

  attr_accessor :data

  def self.run!
    @@data = GameStartup.run!
    level_start
  end

  def self.level_start
    while @@data[:step] != "end" && @@data[:level] != "end"
      level = Object.const_get(@@data[:level])
      while @@data[:step] != "next_level" do
        @@data[:step], @@data[:level] = level.send(@@data[:step], @@data)
        LoadAndSave.save(@@data)
      end
      if @@data[:step] == "next_level"
        @@data[:step] == "start_point"
      end
    end
  end






end
