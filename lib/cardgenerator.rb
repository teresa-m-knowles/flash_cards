require './lib/card'
require './lib/deck'
require 'pry'

class CardGenerator

  attr_reader :cards

  def initialize(filename)
    @file = filename
  end

  def cards
    @cards = []
    File.readlines(@file).each do |line|
      card = line.split(',')
      new_card = Card.new(card[0], card[1], card[2])
      @cards << new_card
    end
    @cards
  end


end
