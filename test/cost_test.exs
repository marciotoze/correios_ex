defmodule CorreiosEx.CostTest do
  use CorreiosEx.ApiCase, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import CorreiosEx.Cost

  doctest CorreiosEx.Cost

  setup_all do
    HTTPoison.start()
  end

  test "national/3", %{client: client} do
    params = %{cepDestino: "71930000", cepOrigem: "70902000", psObjeto: 300}
    service_code = "04162"

    use_cassette "cost/national#3" do
      assert {200, %{"pcFinal" => _}, _response} =
               national(client, service_code, params)
    end
  end

  test "national/2", %{client: client} do
    body = %{
      idLote: "string",
      parametrosProduto: [
        %{
          cepDestino: "71930000",
          cepOrigem: "70902000",
          psObjeto: 300,
          coProduto: "04162",
          nuRequisicao: "123"
        },
        %{
          cepDestino: "71930001",
          cepOrigem: "70902001",
          psObjeto: 300,
          coProduto: "04162",
          nuRequisicao: "234"
        }
      ]
    }

    use_cassette "cost/national#2" do
      resource = national(client, body)
      {_, body, _} = resource

      assert {200, [%{"pcFinal" => _} | _], _response} = resource
      assert length(body) == 2
    end
  end

  test "international/3", %{client: client} do
    params = %{sgPaisDestino: "US", cepOrigem: "70902000", psObjeto: 300}
    service_code = "45110"

    use_cassette "cost/international#3" do
      assert {200, %{"pcFinal" => _}, _response} = international(client, service_code, params)
    end
  end

  test "international/2", %{client: client} do
    body = %{
      idLote: "string",
      parametrosProduto: [
        %{
          sgPaisDestino: "US",
          cepOrigem: "70902000",
          psObjeto: 300,
          coProduto: "45110",
          nuRequisicao: "123"
        },
        %{
          sgPaisDestino: "US",
          cepOrigem: "70902001",
          psObjeto: 300,
          coProduto: "45110",
          nuRequisicao: "123"
        }
      ]
    }

    use_cassette "cost/international#2" do
      resource = international(client, body)
      {_, body, _} = resource

      assert {200, [%{"pcFinal" => _} | _], _response} = resource
      assert length(body) == 2
    end
  end
end
