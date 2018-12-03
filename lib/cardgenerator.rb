require './lib/card'
require './lib/deck'
require 'pry'

class CardGenerator

  attr_reader :cards

  def initialize(filename)
    @file = File.open(filename)
  end

  def cards


    @cards = @file.readlines.map do |line|
      card = line.split(',')
      Card.new(card[0], card[1], card[2])
    end
    Deck.new(@cards)
  end


end
