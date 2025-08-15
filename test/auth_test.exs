defmodule CorreiosEx.AuthTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import CorreiosEx.Auth

  doctest CorreiosEx.Auth

  @client CorreiosEx.Client.new(
            %{
              user: "hgimporthom",
              api_code: "9QFAX2Sjr3uGB5OQrBhQvHSVG2uIzXxk1Jgkr7jc"
            },
            "https://apihom.correios.com.br"
          )

  setup_all do
    HTTPoison.start()
  end

  test "by_user/1" do
    use_cassette "auth#by_user" do
      assert {201, %{"token" => _, "expiraEm" => _}, _response} = by_user(@client)
    end
  end

  test "by_postcard/1" do
    use_cassette "auth#by_postcard" do
      assert {201, %{"token" => _, "expiraEm" => _, "cartaoPostagem" => _}, _response} =
               by_postcard(@client, %{"numero" => "0073249300"})
    end
  end

  test "by_contract/1" do
    use_cassette "auth#by_contract" do
      assert {201, %{"token" => _, "expiraEm" => _, "contrato" => _}, _response} =
               by_contract(@client, %{"numero" => "9912414279"})
    end
  end
end
