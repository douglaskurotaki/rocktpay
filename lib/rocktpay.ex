defmodule Rocktpay do
  alias Rocktpay.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call # chama a funcao call o User.Create
end
