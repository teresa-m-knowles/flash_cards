require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

require 'pry'



class TurnTest < Minitest::Test

def test_it_exists
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

   turn = Turn.new("Juneau",card)

   assert_instance_of Turn, turn
end

def test_the_guess_is_the_initialized_string
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  turn = Turn.new("Juneau",card)

  assert_equal "Juneau", turn.guess
end

def test_it_can_compare_guess_and_card_answer
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  turn = Turn.new("Juneau",card)

  assert_equal card.answer, turn.guess


  turn2 = Turn.new("Denver", card)

  refute_equal turn2.guess, card.answer
end

def test_it_returns_true_if_card_answer_matches_turn_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  turn = Turn.new("Juneau",card)

  assert turn.correct?

end

def test_it_provides_correct_feedback

  card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  turn = Turn.new("Mercury", card)
  turn2 =Turn.new("Saturn", card)

  correct = "Correct!"
  incorrect = "Incorrect!"
  assert_equal correct, turn.feedback
  assert_equal incorrect, turn2.feedback
end




end
