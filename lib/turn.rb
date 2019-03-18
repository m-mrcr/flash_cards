class Turn

  attr_reader :guess,
              :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess.upcase == @card.answer.upcase
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end

end
