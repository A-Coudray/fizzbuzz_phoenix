defmodule FizzBuzz.FizzBuzzElement do
  use Ecto.Schema

  schema "fizzBuzzValues" do
    field :number, :string
    field :fizz_buzz_value, :string
    field :favourited, :boolean
  end
end
