defmodule FizzbuzzPhoenixWeb.SaveFavouriteChannel do
  use Phoenix.Channel

  def join("save:*", _payload, socket) do
    {:ok, socket}
  end


  def handle_in("save_favourite", %{"number" => number}, socket) do

    current_element = FizzBuzz.FizzBuzzElement |> FizzBuzz.Repo.get_by(number: Integer.to_string(number))
    cond do
       current_element.favourited ->
         updated_element = %FizzBuzz.FizzBuzzElementStruct{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: false}

         FizzBuzz.FizzBuzzElement.update_favourite_status(Integer.to_string(number), false)
         {:reply, {:ok, updated_element}, socket}
       true ->
         updated_element = %FizzBuzz.FizzBuzzElementStruct{ number:  current_element.number, fizz_buzz_value: current_element.fizz_buzz_value, favourited: true}
         FizzBuzz.FizzBuzzElement.update_favourite_status(Integer.to_string(number), true)
         {:reply, {:ok, updated_element}, socket}
    end
  end

end