defmodule Rocktpay.Users.Create do
  alias Rocktpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
