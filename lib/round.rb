require './lib/deck'
require './lib/card'
require './lib/turn'

require 'pry'

class Round

  attr_accessor   :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []

  end

   def take_turn(string)

     new_turn = Turn.new(string, current_card)
     @turns << new_turn
     @deck.cards.rotate!
     new_turn
   end

   def current_card
     @deck.cards[0]
   end

   def number_correct
     number_correct = 0
     @turns.each do |each_turn|
       if each_turn.correct? == true
         number_correct += 1
       end #ends if
     end #ends each block

     number_correct #returns counter

   end


def number_correct_by_category(category)
  @turns.count do |each_turn|
    each_turn.correct? == true && each_turn.card.category == category
  end
end

def percent_correct
   answer = (number_correct.to_f / @turns.size) * 100.0
   answer.round(2)
end

def percent_correct_by_category(category)


  number_of_correct_answers_by_category = number_correct_by_category(category)

  turns_in_each_category = @turns.count do |each_turn|
      each_turn.card.category == category
  end

    if turns_in_each_category == 0
      answer = 0

    else
    answer = (number_of_correct_answers_by_category.to_f/turns_in_each_category.to_f) * 100.0
    end

    return answer.round(2)

end

def start

  turns_counter = 1

  puts "Welcome! You're playing with #{deck.cards.count} cards"
  puts "---------------------------------------------------"

until turns_counter ==  (deck.cards.count + 1)   do

  puts "This is card #{turns_counter} out of #{deck.cards.count}"
  puts "Question: #{current_card.question}"
  answer = gets.chomp.upcase
  puts take_turn(answer).feedback
  turns_counter += 1
end

puts "****** Game over! ******"
puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a total score of #{percent_correct}%."

question_categories = deck.cards.uniq { |card| card.category }


 question_categories.each do |each_category|
  puts "#{each_category.category} - #{percent_correct_by_category(each_category.category)}% correct."
end
end


end
