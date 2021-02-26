defmodule Rocktpay do
  alias Rocktpay.Users.Create, as: UserCreate
  alias Rocktpay.Accounts.{Deposit, Transaction, Withdraw}

  defdelegate create_user(params), to: UserCreate, as: :call # chama a funcao call o User.Create
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call
  defdelegate transaction(params), to: Transaction, as: :call
end
