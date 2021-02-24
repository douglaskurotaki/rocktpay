defmodule RocktpayWeb.UsersController do
  use RocktpayWeb, :controller

  alias Rocktpay.User

  def create(conn, params) do
    params
    |> Rocktpay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(RocktpayWeb.ErrorView)
    |> render("400.json", result: reason)
  end
end
