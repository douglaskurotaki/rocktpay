defmodule RocktpayWeb.UsersController do
  use RocktpayWeb, :controller

  alias Rocktpay.User

  action_fallback RocktpayWeb.FallbackController

  def create(conn, params) do
    # with eh como uma pattern match, que verifica no caso o parametro {:ok, %User{} = user}
    # Caso passe, ele faz a criacao e a rendereizacao, caso nao, ele devolve o erro pra quem o chamou
    # que no caso quem valida esse erro eh o fallback
    with {:ok, %User{} = user} <- Rocktpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
