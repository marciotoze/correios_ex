defmodule CorreiosEx.AuthTest do
  use CorreiosEx.ApiCase, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import CorreiosEx.Auth

  doctest CorreiosEx.Auth

  setup_all do
    HTTPoison.start()
  end

  test "by_user/1", %{basic_client: client} do
    use_cassette "auth/by_user#1" do
      assert {201, %{"token" => _, "expiraEm" => _}, _response} = by_user(client)
    end
  end

  test "by_postcard/1", %{basic_client: client} do
    use_cassette "auth/by_postcard#1" do
      assert {201, %{"token" => _, "expiraEm" => _, "cartaoPostagem" => _}, _response} =
               by_postcard(client, %{"numero" => "0076056856"})
    end
  end

  test "by_contract/1", %{basic_client: client} do
    use_cassette "auth/by_contract#1" do
      assert {201, %{"token" => _, "expiraEm" => _, "contrato" => _}, _response} =
               by_contract(client, %{"numero" => "9912515762"})
    end
  end
end
