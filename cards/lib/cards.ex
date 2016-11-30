defmodule Cards do
  #new function
  def hello do
    #note the implicit return of the last value
    "hi there!"
  end

  def create_deck do
    #notice the complete and total lack of objs... everything is data
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Spades", "Diamonds", "Clubs"]

    for suit <- suits do
      # for every suit in suits, execute this doblock
      suit
      #for is essentially a mapping function... this will return a new list
    end
    #Data is elixir is immutable... everything returns new data, anything made by create_deck/0 will NEVER be reassigned. 
  end

  def shuffle(deck) do
    # this def is shuffle/1... make sure your arity is correct!
    Enum.shuffle(deck)
    #Docs: http://elixir-lang.org/docs/stable/elixir/Enum.html#shuffle/1 check out rest of Enum module as well.
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
