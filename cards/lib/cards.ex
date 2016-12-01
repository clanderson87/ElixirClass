defmodule Cards do
  #@moduledoc  section for providing module documentation using ex_doc
  #create using 'mix docs' in the root directory
  @moduledoc"""
    Provides methods for creating and handling for a deck of playing cards
  """

  #new function
  def hello do
    #note the implicit return of the last value
    "hi there!"
  end

  #@doc section used for providing method documentation using ex_doc
  @doc"""
    Returns a list of strings representing a deck of playing cards
  """
  #notice this is above the method declaration
  def create_deck do
    #notice the complete and total lack of objs... everything is data
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Spades", "Diamonds", "Clubs"]

    for suit <- suits, value <- values do
      # for every suit in suits, execute this doblock with each value in values
      "#{value} of #{suit}"
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
    # if function returns a bool, then convention is to name it with 
    Enum.member?(deck, card)
  end

  @doc"""
    Divides a deck into a hand and the remainder of the deck. 
    The `hand_size` argument indicates how many cards should be in the hand.

    ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  # notice the backticks (``) around hand_size. This will be pretty-printed like code in the docs.
  # Also, note the format of '## Examples'
  #   -Must start with '## Examples'
  #   -Must have a newline char after '## Examples'
  #   -Must be indented 3 tabs from the @@doc """
  #   -Follow with a new line
  # This pretty-prints code examples.
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
    #this will create a tuple where the first value will be the hand, and the second val will be the remaining deck.
    #this key value pair, but without the keys... the location of the object (first pos, second pos) will determine
    #what the values mean
  end

  def save(deck, filename) do
    #whenever we need to write Erlang code under elixir, we write the :erlang atom
    #this code is using :erlang's built in term_to_binary function
    #which we're going save using the Elixir File module.
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary) 
  end

    #def load(filename) do
    #  {status, binary} = File.read(filename)
    ## Instructor note: Try to avoid if statements at all possible cost. Try to use
    #  #case statements like the one below and pattern matching
    #  case status do
    #    :ok -> :erlang.binary_to_term binary
    #    :error -> "that file doesn't exist"
    #  end
    # :word is called an atom in Elixir. It is a primitive data type. They're generally used for status codes
    # or control . They're like strings aimed only at devs, not users.
  #end

  def load(filename) do
    #alternate (more concise) way of doing this the above!!
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file isn't here"
      #the _ before a var name (like _reason above) tells elixir that, due to pattrn matching
      #we know there will be a variable in there, but we really don't care what it is. The _ will
      #kill compiler warnings
    end
  end

  def create_hand(hand_size) do
    #We're about to see why pipes are awesome. Instead of: 
      #deck = Cards.create_deck
      #deck = Cards.shuffle(deck)
      #hand = Cards.deal(deck, hand_size)
    #We're gonna do:
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    # Think of this like chaining functions in jQuery.
    # NB: Pipe operator wants us to chain operations that have consistent first arguments. 
    # Note how Cards.shuffle and Cards.deal use the deck as the first arg. Thats what pipe op wants. 
  end

end
