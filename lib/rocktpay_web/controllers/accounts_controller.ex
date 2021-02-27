defmodule RocktpayWeb.AccountsController do
  use RocktpayWeb, :controller

  alias Rocktpay.Account
  alias Rocktpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback RocktpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Rocktpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Rocktpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    # task = Task.async(fn -> Rocktpay.transaction(params) end)
    # result = Task.await(task)

    with {:ok, %TransactionResponse{} = transaction} <- Rocktpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
