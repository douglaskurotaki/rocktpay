defmodule RocktpayWeb.WelcomeController do
  use RocktpayWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to the Rocketpay API")
  end
end
