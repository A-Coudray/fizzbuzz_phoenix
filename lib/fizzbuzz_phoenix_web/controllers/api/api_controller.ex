defmodule FizzbuzzPhoenixWeb.Api.ApiController do
  use FizzbuzzPhoenixWeb, :controller



  @page_size 100

  # the api version of the controller, similar function
  def index(conn, params) do

    page_number = FizzbuzzPhoenixWeb.PageController.get_param_value(params, "page", 1)
    page_size = FizzbuzzPhoenixWeb.PageController.get_param_value(params, "page_size", @page_size)
    first_number_of_current_page = 1 + (page_number-1)*page_size
    last_number_of_current_page = (page_size-1) + first_number_of_current_page
    sequence = Enum.map(first_number_of_current_page..last_number_of_current_page, &FizzbuzzPhoenixWeb.PageController.fetch_or_generate_fizzbuzz_element/1)

    json(conn, %{data: sequence})

  end

  # this function is different, as one can set a number to favourite with the API, the values need to be generated or fetched first
  def update(conn, %{"number" => number}) do

    current_element = FizzbuzzPhoenixWeb.PageController.fetch_or_generate_fizzbuzz_element(String.to_integer(number))

    updated_element = %FizzBuzz.FizzBuzzElementStruct{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: true}
    FizzBuzz.FizzBuzzElement.update_favourite_status(number, true)
    json(conn, %{data: updated_element})

  end
  # this function is different, as one can unset a number to favourite with the API, the values need to be generated or fetched first
  def remove(conn, %{"number" => number}) do

    current_element = FizzbuzzPhoenixWeb.PageController.fetch_or_generate_fizzbuzz_element(String.to_integer(number))

    updated_element = %FizzBuzz.FizzBuzzElementStruct{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: false}
    FizzBuzz.FizzBuzzElement.update_favourite_status(number, false)
    json(conn, %{data: updated_element})

  end



end