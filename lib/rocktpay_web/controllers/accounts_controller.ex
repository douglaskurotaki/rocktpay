defmodule RocktpayWeb.AccountsController do
  use RocktpayWeb, :controller

  alias Rocktpay.Account

  action_fallback RocktpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocktpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
