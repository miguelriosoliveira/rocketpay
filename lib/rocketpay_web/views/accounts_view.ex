defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance updated succesfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end
end
