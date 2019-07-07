defmodule FizzbuzzPhoenixWeb.PageController do
  use FizzbuzzPhoenixWeb, :controller

  # 100 items per page
  @page_size 100
  # maximum of  100 000 000 000 items
  @mex_size 100000000000
  # calculate the number of pages required
  @pages_nb div(@mex_size, @page_size)

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
