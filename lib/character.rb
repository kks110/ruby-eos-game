require 'load_and_save'
require 'gui_loader'
# Basic set up of player to get their name.

class Character

  @name = "Name"

  attr_accessor :name

  def initialize
    puts "Welcome, what is your name?: "
    @name = gets.chomp.downcase.capitalize
    puts "Welcome #{@name}, lets begin your adventure!"
  end


end
