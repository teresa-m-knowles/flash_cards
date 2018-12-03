require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'

class CardGeneratorTest < MiniTest::Test

  def test_it_exists
    new_generator = CardGenerator.new('cards.txt')

    assert_instance_of CardGenerator, new_generator

  end

  def test_it_can_read_the_file_and_generate_a_deck
    new_generator = CardGenerator.new('cards.txt')
    test_card = Card.new("Who was the first Roman emperor?","Augustus", :History)
    new_deck = new_generator.cards
    assert_equal test_card.answer, new_deck.cards[0].answer
  end

end
