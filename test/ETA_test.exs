defmodule CorreiosEx.ETATest do
  use CorreiosEx.ApiCase, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import CorreiosEx.ETA

  doctest CorreiosEx.ETA

  setup_all do
    HTTPoison.start()
  end

  test "national/3", %{client: client} do
    params = %{cepDestino: "71930000", cepOrigem: "70902000"}
    service_code = "04162"

    use_cassette "eta#national_3" do
      assert {200, %{"dataMaxima" => _}, _response} =
               national(client, service_code, params)
    end
  end

  test "national/2", %{client: client} do
    body = %{
      idLote: "string",
      parametrosPrazo: [
        %{
          cepDestino: "71930000",
          cepOrigem: "70902000",
          coProduto: "04162",
          nuRequisicao: "123"
        },
        %{
          cepDestino: "71930001",
          cepOrigem: "70902001",
          coProduto: "04162",
          nuRequisicao: "123"
        }
      ]
    }

    use_cassette "eta#national_2" do
      resource = national(client, body)
      {_, body, _} = resource

      assert {200, [%{"dataMaxima" => _} | _], _response} = resource
      assert length(body) == 2
    end
  end

  test "international_import/3", %{client: client} do
    params = %{cepDestino: "71930000", cepOrigem: "70902000"}
    service_code = "45110"

    use_cassette "eta#international_import_3" do
      assert {200, %{"dataMaxima" => _}, _response} =
               international_import(client, service_code, params)
    end
  end

  test "international_export/3", %{client: client} do
    params = %{sgPaisOrigem: "BR", sgPaisDestino: "US", dtPostagem: "14-08-2025"}
    service_code = "45110"

    use_cassette "eta#international_export_3" do
      assert {200, %{"prazoMaximo" => _, "prazoMinimo" => _}, _response} =
               international_export(client, service_code, params)
    end
  end
end
