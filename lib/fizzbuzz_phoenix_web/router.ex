defmodule FizzbuzzPhoenixWeb.Router do
  use FizzbuzzPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FizzbuzzPhoenixWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", FizzbuzzPhoenixWeb.Api, as: :api do
    pipe_through :api

    get "/page", ApiController, :index

    put "/favourite/:number", ApiController, :update

    delete "/favourite/:number", ApiController, :remove

  end
end
