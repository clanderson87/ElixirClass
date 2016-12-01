defmodule CardsTest do
  use ExUnit.Case
  doctest Cards
  # ^^^ this line enables doctesting for the Cards module.

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
    #asserts be fed bool expressions
  end

  test "shuffling a deck randomizez it" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
    # Also could be written as:
    #refute deck == Cards.shuffle(deck)

    #assert true expressions
    #refute false expressions
  end
end
