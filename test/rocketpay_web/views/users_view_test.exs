defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Miguel",
      password: "123456",
      nickname: "MiguelRisos",
      email: "miguel@miguel.com",
      age: 28
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        id: user_id,
        name: "Miguel",
        nickname: "MiguelRisos",
        account: %{
          id: account_id,
          balance: Decimal.new("0")
        }
      }
    }

    assert expected_response == response
  end
end
