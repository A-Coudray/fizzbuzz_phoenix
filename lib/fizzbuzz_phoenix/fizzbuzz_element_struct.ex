defmodule FizzBuzz.FizzBuzzElementStruct do
  @derive {Jason.Encoder, only: [:number, :fizz_buzz_value, :favourited]}
  defstruct number: 0, fizz_buzz_value: "", favourited: false
end
