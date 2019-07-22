defmodule FizzBuzz.FizzBuzzElement do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

# Jason rules for json parsing
  @derive {Jason.Encoder, only: [:number, :fizz_buzz_value, :favourited]}
#the db schema
  schema "fizzBuzzValues" do
    field :number, :string
    field :fizz_buzz_value, :string
    field :favourited, :boolean
  end

#required changeset so all fields are required and all numbers are unique
  def changeset(element, params \\ %{}) do
    element
    |> cast(params, [:number, :fizz_buzz_value, :favourited])
    |> validate_required([:number, :fizz_buzz_value, :favourited])
    |> unique_constraint(:number)
  end

  # function to update the favourited field of an element in the db
  def update_favourite_status(number, favourited) do

    query = from( elt in "fizzBuzzValues",
            where: elt.number == ^number,
            update: [set: [favourited: ^favourited]])
                    |> FizzBuzz.Repo.update_all([])


  end

end
