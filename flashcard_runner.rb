require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'

require 'pry'

new_generator = CardGenerator.new('cards.txt')
round = Round.new(new_generator.cards)
round.start
