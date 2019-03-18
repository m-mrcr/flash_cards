require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new

    assert_instance_of Deck, deck
  end

  def test_it_initializes_as_empty
    deck = Deck.new

    assert_equal [], deck.cards
  end

end
