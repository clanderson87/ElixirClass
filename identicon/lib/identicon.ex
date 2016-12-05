defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(image) do
    %Identicon.Image{hex: [r, g, b | _tail]} = image
    #the pipe _tail tells elixir that we acknoledge that hex_list has more than three values,
    # but remember, with the _var, we just don't care about anything after the pipe!
    [r, g, b]
  end

  def hash_input(input) do
    hexVal = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hexVal}
  end
end
