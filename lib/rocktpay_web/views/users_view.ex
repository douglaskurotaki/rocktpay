defmodule RocktpayWeb.UsersView do
  alias Rocktpay.{Account, User}

  def render(
    "create.json",
    %{
      user: %User{
        account: %Account{
          id: account,
          balance: balance
        },
        id: id,
        name: name,
        nickname: nickname
        }
    })
  do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        nickname: nickname,
        account: %{
          id: account,
          balance: balance
        }
      }
    }
  end
end
