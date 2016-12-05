defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    #Above is an example of pattern matching in the method definition. Neat.
    #the pipe _tail tells elixir that we acknoledge that hex_list has more than three values,
    # but remember, with the _var, we just don't care about anything after the pipe!
    %Identicon.Image{image | color: {r, g, b}}
    #Here we're creating a new struct that consumes the image passed into pick_color/1
    #In functional programming, there is no image.color = rgb... there is just data.
  end

  

  def hash_input(input) do
    hexVal = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hexVal}
  end
end
