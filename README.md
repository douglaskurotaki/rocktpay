# Rocktpay

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

# This a Elixir Project for study new knowloge and get a notion about that technology
## To create a new project we gonna write:
```exs
mix phx.new rocktpay --no-webpack --no-html
# No use front-end tech's
```
## To check if the database is configured success
```exs
mix ecto.setup
```

---

**The file mix.exs is the configuration of all project**
The extension **Elixir** Linter and other we need a lib **Credo**
```exs
# mix.exs
defp deps do
    [
      {:phoenix, "~> 1.5.7"},
      {:phoenix_ecto, "~> 4.1"},
      {:ecto_sql, "~> 3.4"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_live_dashboard, "~> 0.4"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false} # Include this row
    ]
  end
```
## To download all libs configured
```exs
mix deps.get 
```

## To compile and set config credo
```exs
mix credo gen.config
```

---

As we dont worry with documentation, we need disable a config `.credo.exs`
```
{Credo.Check.Readability.ModuleDoc, false}, # Update this row
```

## To up the server phoenix:
```
mix phx.server
```

## Folder lib
#### There are 2 folder inside lib
- rocketpay -> logical and rules system
- rocketpay_web -> all we need to build a web system

---

# Create a new route
In file `router.ex`
```ex
get "/", WelcomeController, :index
```
We created a route '/', that call the WelcomeController that its function is `index`
Now we gonna create the controller `welocome_controller.ex`
## 1º way that create controller
We need define the module
```defmodule RocktpayWeb.WelcomeController do```
## 2º way that create controller
it's necessary considerer special file, 'cause is a controller
```
use RocktpayWeb, :controller
```
## 3º way that create controller
Create de action `index`
```ex
def index(conn, _params)
```

---

# Create Logical
## To read a file 
```ex
File.read("#{filename}.csv")
```

## To open console/console with project
```
iex
iex -S mix
```

## 1 row function
```
defp handle_file({:ok, file}), do file
```
if the params is :ok, this return the file

---

## To check if the database was created
```
mix exto.create
```

## To create any migration
```
mix ecto.gen.migration create_user_table
```

## To run the migration
```
mix ecto.migrate
```

## To drop the database
```
mix ecto.drop
```

## Config to use binary id for pk and fk
```
config :rocktpay, Rocktpay.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreing_key: [type: :binary_id]
```

