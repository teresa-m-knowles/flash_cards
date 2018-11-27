class Turn

  def initialize(string, Card)
    @string = string
    @Card = Card
  end

  def guess
    @string
  end

  def card
    @Card
  end

  def correct?
    @Card.answer == @string
  end

  def feedback
    if self.correct? ==true
      'Correct!'
    else
      'Incorrect!'
    end
  end


end
