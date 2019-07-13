defmodule FizzbuzzPhoenixWeb.PageController do
  use FizzbuzzPhoenixWeb, :controller


  # 100 items per page
  @page_size 100
  # maximum of  100 000 000 000 items
  @max_size 100000000000
  # calculate the number of pages required
  @pages_nb div(@max_size, @page_size)

  def index(conn, params) do
    page_number = get_param_value(params, "page", 1)
    page_size = get_param_value(params, "page_size", @page_size)
    first_number_of_current_page = 1 + (page_number-1)*@page_size
    last_number_of_current_page = (@page_size-1) + first_number_of_current_page
    sequence = Enum.map(first_number_of_current_page..last_number_of_current_page, &fetch_or_generate_fizzbuzz_element/1)

    page = %Scrivener.Page{
      entries: sequence,
      page_number: page_number,
      page_size: page_size,
      total_entries: @max_size,
      total_pages: @pages_nb
    }

    render(conn, "index.html", page: page)
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

  defp get_param_value(params, name, default) do
    %{^name => value} = params

    case Integer.parse value do
      {int, _rem} -> if int > 0, do: int, else: default
      :error -> default
    end

  rescue
    MatchError -> default
  end
end
