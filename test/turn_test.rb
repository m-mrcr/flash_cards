require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Junaeu", card_1)

    assert_instance_of Turn, turn
  end

  def test_that_the_turn_can_have_a_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    assert_equal card_1, turn.card
  end

  def test_it_has_a_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    assert_equal "Juneau", turn.guess
  end

  def test_it_can_tell_if_guess_is_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    assert_equal true, turn.correct?
  end

  def test_it_can_give_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    assert_equal "Correct!", turn.feedback
  end

  def test_it_can_see_another_card
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card_2)

    assert_equal card_2, turn.card
  end

  def test_it_can_test_if_guess_is_wrong
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card_2)

    assert_equal false, turn.correct?
  end

  def test_it_can_give_different_feedback
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card_2)

    assert_equal "Incorrect.", turn.feedback
  end

end
