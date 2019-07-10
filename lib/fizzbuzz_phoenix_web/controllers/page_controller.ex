defmodule FizzbuzzPhoenixWeb.PageController do
  use FizzbuzzPhoenixWeb, :controller


  # 100 items per page
  @page_size 100
  # maximum of  100 000 000 000 items
  @mex_size 100000000000
  # calculate the number of pages required
  @pages_nb div(@mex_size, @page_size)

  def index(conn, _params) do

    sequence = Enum.map(1..100000000000, &fetch_or_generate_fizzbuzz_element/1)


    render(conn, "index.html")
  end

  defp fetch_or_generate_fizzbuzz_element(number) do

    current_element = FizzBuzz.FizzBuzzElement |> FizzBuzz.Repo.get_by(number: number)

    cond do
      current_element == nil ->
       FizzBuzz.Repo.insert(%FizzBuzz.FizzBuzzElement{ number: number, fizz_buzz_value: FizzBuzz.fizzbuzz(number), favourited: false})
    true ->
      current_element
    end


  end
end
