defmodule FizzbuzzPhoenixWeb.SaveFavouriteChannel do
  use Phoenix.Channel

  def join("save:*", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("save_favourite", %{"number" => number}, socket) do

    current_element = FizzBuzz.FizzBuzzElement |> FizzBuzz.Repo.get_by(number: number)
    updated_element = %FizzBuzz.FizzBuzzElement{}
    cond do
       current_element.favourited ->
         updated_element = %FizzBuzz.FizzBuzzElement{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: false}
       !current_element.favourited ->
         updated_element = %FizzBuzz.FizzBuzzElement{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: true}
    end

    FizzBuzz.Repo.update(updated_element)

    {:reply, {:ok, updated_element}, socket}

  end

end