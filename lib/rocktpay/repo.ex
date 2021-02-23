defmodule Rocktpay.Repo do
  use Ecto.Repo,
    otp_app: :rocktpay,
    adapter: Ecto.Adapters.Postgres
end
