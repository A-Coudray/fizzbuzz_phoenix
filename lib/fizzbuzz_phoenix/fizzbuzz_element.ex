defmodule FizzBuzz.FizzBuzzElement do
  use Ecto.Schema

  schema "fizzBuzzValues" do
    field :number, :integer
    field :fizz_buzz_value, :string
    field :favourited, :boolean
  end
end
