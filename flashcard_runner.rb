require './lib/card'
require './lib/deck'
require './lib/round'

require 'pry'

card_1 = Card.new("Who was the first Roman emperor", "Augustus", :History )
card_2 = Card.new("How do you say hello in French?", "Bonjour", :Languages)
card_3 = Card.new("Who is the author of Things Fall Apart?  ", "Chinua Achebe", :Literature)
card_4 = Card.new("In what year did WWII end?", "1945", :History)
card_5 = Card.new("What was the only novel to be written by Margaret Mitchell?", "Gone with the Wind", :Literature)
card_6 = Card.new("How do you say four in Spanish?", "cuatro", :Languages)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]

deck = Deck.new(cards)
round = Round.new(deck)

round.start
