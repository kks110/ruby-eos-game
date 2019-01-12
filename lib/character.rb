require 'load_and_save'

class Character

  @name = "Name"

  attr_accessor :name

  def initialize
    puts "Welcome, what is your name?: "
    @name = gets.chomp.downcase.capitalize
    puts "Welcome #{@name}, lets begin your adventure!"
  end


end
