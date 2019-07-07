defmodule FizzBuzz.Repo do
  use Ecto.Repo,
    otp_app: :fizzbuzz_phoenix,
    adapter: Ecto.Adapters.Postgres
end
