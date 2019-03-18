class Round

  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@current_card]
  end

  def total_cards
    @deck.cards.length
  end

  def total_guesses
    @turns
  end

  def count
    @turns.length
  end

  def take_turn(guess)
    new_turn = Turn.new(guess.upcase, current_card)
    @turns << new_turn
    @current_card += 1
    @number_correct += 1 if new_turn.correct?
    new_turn
  end

  def number_correct_by_category(category)
    total = 0
    @turns.each {|turn| total += 1 if turn.correct? && turn.card.category == category}
    total
  end

 def percent_correct
   (@number_correct.to_f / count) * 100
 end

 def percent_correct_by_category(category)
   category_total = 0
   @turns.select {|turn| category_total += 1 if turn.card.category == category}
   (number_correct_by_category(category) / category_total) * 100
 end

 def printed_percent_by_category
   cards =[]
   @turns.find_all do |turn|
     cards.push(turn.card)
   end
   categories = []
   cards.find_all do |card|
     categories.push(card.category)
   end
   categories.uniq.select do |category|
     p "#{category} - #{percent_correct_by_category(category)}% correct"
   end
 end

 def start
   p "Welcome! You're reviewing #{total_cards} cards."
   p "-------------------------------------------------"
   while @current_card + 1 <= total_cards
     p "This is card number #{count + 1} of #{total_cards}"
     p "Question: #{current_card.question}"
     p "Enter your answer: "
     guess = gets.chomp
     p take_turn(guess).feedback
     p "-------------------------------------------------"
   end
   p "****** Review Over! ******"
   p "You had #{@number_correct} correct guesses out of #{count} for a total of #{percent_correct}%"
   printed_percent_by_category
 end
end
