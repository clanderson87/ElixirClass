defmodule Identicon.Image do
  #this struct holds all data within application
  #structs state that the only data that a struct can hold is what we define.
  #In this case, a struct can only hold a hex property. Maps, on the other hand,
  #data floosies that let you hold any data you want in there.
  defstruct hex: nil, color: nil
  #Remember, this is a primitive data type... not a method container,
  #nor a model.
end