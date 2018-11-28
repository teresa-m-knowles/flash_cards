require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

  attr_accessor :deck, :current_card, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards[0]
    @turns = []
    @number_correct = 0
  end

   def take_turn(string)

     new_turn = Turn.new(string, self.current_card)
     @turns << new_turn
     if new_turn.correct? == true
        @number_correct += 1
     end
     @deck.cards.rotate!
     new_turn
   end

   def current_card
     @deck.cards[0]
   end





   # def number_correct
   #   @turns.each do |element_of_turn_array|
   #     if element_of_turn_array.correct? == true
   #       @number_correct_counter += 1
   #     end
   #   end
   # end





end
