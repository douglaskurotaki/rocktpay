defmodule RocktpayWeb.AccountsView do
  alias Rocktpay.Account

  def render(
        "update.json",
        %{
          account: %Account{
            id: account,
            balance: balance
          }
        }
      ) do
    %{
      message: "Ballance changed successfully",
      account: %{
        id: account,
        balance: balance
      }
    }
  end
end
