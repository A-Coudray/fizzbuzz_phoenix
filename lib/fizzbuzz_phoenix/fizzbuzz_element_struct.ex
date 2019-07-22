defmodule FizzBuzz.FizzBuzzElementStruct do
  #a simple struct that matches the schema from the db, had to use it for convenience and interactions with the JS part
  @derive {Jason.Encoder, only: [:number, :fizz_buzz_value, :favourited]}
  defstruct number: 0, fizz_buzz_value: "", favourited: false
end
