
class Character

  @name = "Name"

  attr_accessor :name

  def initialize
    puts "Welcome, what is your name?: "
    @name = gets.chomp.downcase.capitalize
    puts "Welcome #{@name}, let begin your adventure!"
  end

end
