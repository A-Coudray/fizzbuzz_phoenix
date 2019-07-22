defmodule FizzbuzzPhoenixWeb.ChannelsTest do

  use FizzbuzzPhoenixWeb.ChannelCase



  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(FizzbuzzPhoenixWeb.SaveFavouriteChannel, "save:*")

    {:ok, socket: socket}
  end


  #testing the toggle with the socket and looking directly in the db
  test "setting a new favourite", %{socket: socket} do

    current_element = FizzBuzz.FizzBuzzElement |> FizzBuzz.Repo.get_by(number: Integer.to_string(999))

    ref = push socket, "save_favourite", %{"number" => 999}
    assert_reply ref, :ok

    updated_element = FizzBuzz.FizzBuzzElement |> FizzBuzz.Repo.get_by(number: Integer.to_string(999))

    assert updated_element.favourited == !current_element.favourited


  end





end