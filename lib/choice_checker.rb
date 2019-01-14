
class ChoiceCheck

# Does the check to see if the answer is valid. If not, it will add a line asking for the user to give a correct response and return false.
# If it is valid, will return to the level the answer that the player gave.
  def self.answer_check(answer, options)
    options.each_with_index do |choice, index|
      if answer == choice || answer == (index + 1).to_s
        return choice.downcase.capitalize
      end
    end
    return false
  end

end
