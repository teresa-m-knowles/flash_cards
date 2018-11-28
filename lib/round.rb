require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

  attr_accessor :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

   def take_turn(string)

     new_turn = Turn.new(string, self.current_card)
     @turns << new_turn
     deck.cards.rotate
     new_turn



   end

   def current_card
     deck.cards[0]
   end







end
