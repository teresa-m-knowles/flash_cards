require './lib/card.rb'

class Turn

attr_accessor :string, :card

def initialize(string, card)
  @string = string
  @card = card
end

def guess
  @string
end

def card
  @card
end

def correct?
  @card.answer == self.guess
end

def feedback
  if self.correct? == true
    'Correct!'
  else
    'Incorrect!'
  end
end 


end
