defmodule FizzbuzzPhoenixWeb.PageControllerTest do
  use FizzbuzzPhoenixWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to FizzBuzz Phoenix!"
  end

  test "GET /api/page?page_size=1", %{conn: conn} do
    conn = get(conn, "/api/page?page_size=1")
    assert json_response(conn, 200) ==
             %{"data" => [%{"number" => "1", "fizz_buzz_value" => "1", "favourited" => false}]}
  end

  test "GET /api/page?page_size=2", %{conn: conn} do
    conn = get(conn, "/api/page?page_size=2")
    assert json_response(conn, 200) ==
             %{"data" => [%{"number" => "1", "fizz_buzz_value" => "1", "favourited" => false}, %{"number" => "2", "fizz_buzz_value" => "2", "favourited" => false}]}
  end

  test "GET /api/page?page=10&page_size=1", %{conn: conn} do
    conn = get(conn, "/api/page?page=10&page_size=1")
    assert json_response(conn, 200) ==
             %{"data" => [%{"number" => "10", "fizz_buzz_value" => "Buzz", "favourited" => false}]}
  end

  test "GET /api/page?page=10", %{conn: conn} do
    conn = get(conn, "/api/page?page=10")
    assert hd(json_response(conn, 200)["data"]) ==
             %{"number" => "901", "fizz_buzz_value" => "901", "favourited" => false}
  end

  # page size = 0 should return results with page size = 1
  test "GET /api/page?page_size=0", %{conn: conn} do
    conn = get(conn, "/api/page?page_size=0")
    assert hd(json_response(conn, 200)["data"]) ==
             %{"number" => "1", "fizz_buzz_value" => "1", "favourited" => false}
  end

end
