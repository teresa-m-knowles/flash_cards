require './lib/deck'
require './lib/card'
require './lib/turn'

class Round

  attr_accessor :deck, :current_card, :turn

  def initialize(deck)
    @deck = deck
    @turn = []
  end

   def take_turn(string)

     @new_turn = Turn.new(string, self.current_card)
     # self.move_to_next_card
     # @new_turn



   end

   def current_card
     deck.cards[0]
   end







end
