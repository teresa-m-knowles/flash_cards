require './lib/deck'
require './lib/card'
require './lib/turn'

require 'pry'

class Round

  attr_accessor :deck,
                :current_card,
                 :turns,
                 :number_correct,
                 :number_correct_by_category
                 #:percent_correct

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards[0]
    @turns = []
    @number_correct = 0
    @number_correct_by_category = 0
    #@percent_correct = 0.0
  end

   def take_turn(string)

     @new_turn = Turn.new(string, self.current_card)
     @turns << @new_turn
     @deck.cards.rotate!
     @new_turn
   end

   def current_card
     @deck.cards[0]
   end

   def number_correct
     @number_correct = 0
     @turns.each do |each_turn|
       if each_turn.correct? == true
         @number_correct += 1
       end #ends if
     end #ends each block

     @number_correct #returns counter

   end


def number_correct_by_category(category)
  @turns.count do |each_turn|
    each_turn.correct? == true && each_turn.card.category == category
  end
end

def percent_correct
  @percent_correct =  (number_correct.to_f / @turns.size) * 100.0
  @percent_correct
end

def percent_correct_by_category(category)

  a = number_correct_by_category(category)

  b = @turns.count do |each_turn|
    each_turn.card.category == category
  end

  @percent_correct_by_category = (a/b) * 100.0


end
end
