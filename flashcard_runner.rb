require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'

require 'pry'

new_generator = CardGenerator.new('cards.txt')
new_set_of_cards_from_file = new_generator.cards
new_deck = Deck.new(new_set_of_cards_from_file)
round = Round.new(new_deck)
round.start
