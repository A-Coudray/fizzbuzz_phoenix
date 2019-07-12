defmodule FizzbuzzPhoenixWeb.PageController do
  use FizzbuzzPhoenixWeb, :controller


  # 100 items per page
  @page_size 100
  # maximum of  100 000 000 000 items
  @mex_size 100000000000
  # calculate the number of pages required
  @pages_nb div(@mex_size, @page_size)

  def index(conn, _params) do
    current_page = get_page(_params, "page", 1)
    first_number_of_current_page = 1 + (current_page-1)*@page_size
    last_number_of_current_page = @page_size + first_number_of_current_page
    sequence = Enum.map(first_number_of_current_page..last_number_of_current_page, &fetch_or_generate_fizzbuzz_element/1)


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

  defp get_page(params, name, default) do
    %{^name => value} = params

    case Integer.parse value do
      {int, _rem} -> if int > 0, do: int, else: default
      :error -> default
    end

  rescue
    MatchError -> default
  end
end
