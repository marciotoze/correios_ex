defmodule CorreiosEx.ApiCase do
  use ExUnit.CaseTemplate

  setup_all do
    basic_client =
      CorreiosEx.Client.new(%{
        user: Application.get_env(:correios_ex, :user),
        api_code: Application.get_env(:correios_ex, :api_code)
      })

    client =
      CorreiosEx.Client.new(%{
        access_token: Application.get_env(:correios_ex, :access_token)
      })

    [client: client, basic_client: basic_client]
  end
end
