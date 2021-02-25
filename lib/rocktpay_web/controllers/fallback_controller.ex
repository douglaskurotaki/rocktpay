defmodule RocktpayWeb.FallbackController do
  use RocktpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocktpayWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
