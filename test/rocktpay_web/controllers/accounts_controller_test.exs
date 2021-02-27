defmodule RocktpayWeb.AccountsControllerTest do
  use RocktpayWeb.ConnCase, async: true

  alias Rocktpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      user_params = %{
        name: "FakeName",
        password: "FakePassword",
        nickname: "FakeNickname",
        email: "Fake@email.com",
        age: 31
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocktpay.create_user(user_params)

      conn = put_req_header(conn, "authorization", "Basic YmFuYW5hOm5hbmljYTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
               "account" => %{"balance" => "50.00", "id" => _id},
               "message" => "Ballance changed successfully"
             } = response
    end

    test "when there are invalid, returns an erro", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banan"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expect_response = %{"message" => "Invalid deposit value!"}

      assert response == expect_response
    end
  end
end
