defmodule FizzBuzz.Repo.Migrations.CreateFizzbuzzTable do
  use Ecto.Migration

  def change do
    create table(:fizzBuzzValues) do
      add :number, :string
      add :fizz_buzz_value, :string
      add :favourited, :boolean
    end
  end
end
