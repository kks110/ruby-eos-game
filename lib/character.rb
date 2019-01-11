require 'load_and_save'

class Character

  @name = "Name"

  attr_accessor :name

  def initialize
    puts "Welcome, what is your name?: "
    @name = gets.chomp.downcase.capitalize
    # if LoadAndSave.name_check(@name)
    #   puts "Name already in save file, would you like to load that file, delete that entry or try a new name?"
    #   puts "1 - Load file"
    #   puts "2 - Delete that entry"
    #   puts "3 - New name"
    #   answer = gets.chomp
    #   case answer
    #   when "1"
    #     LoadAndSave.load(name)
    #   when "2"
    #     LoadAndSave.delete(name)
    #   when "3"
    #     puts "What is your name?: "
    #     @name = gets.chomp.downcase.capitalize
    #   end
    # end
    puts "Welcome #{@name}, lets begin your adventure!"
  end

end
