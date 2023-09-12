defmodule eURLixWeb.Router do
  use eURLixWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", eURLixWeb do
    pipe_through :api
    resources "/links", LinkController, except: [:edit]
  end

  scope "/", eURLixWeb do
    get "/:id", LinkController, :get_and_redirect
  end
end
