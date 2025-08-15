defmodule CorreiosEx.ContractTest do
  use CorreiosEx.ApiCase, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import CorreiosEx.Contract

  doctest CorreiosEx.Contract

  setup_all do
    HTTPoison.start()
  end

  test "list/3", %{client: client} do
    cnpj = "29442979000130"

    use_cassette "contract/list#3" do
      assert {200, [%{"nuContrato" => _} | _], _response} = list(client, cnpj)
    end
  end

  test "get/3", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/get#3" do
      assert {200, %{"nuContrato" => ^contract_id}, _response} = get(client, cnpj, contract_id)
    end
  end

  test "services/4", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/services#4" do
      assert {200, %{"itens" => _, "page" => _}, _response} =
               services(client, cnpj, contract_id)
    end
  end

  test "service/4", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"
    service_code = "03298"

    use_cassette "contract/service#4" do
      assert {200, %{"descricao" => "PAC CONTRATO AG"}, _response} =
               service(client, cnpj, contract_id, service_code)
    end
  end

  test "manager_info/3", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/manager_info#3" do
      assert {200, [%{"emails" => _, "telefones" => _} | _], _response} =
               manager_info(client, cnpj, contract_id)
    end
  end

  test "adm_info/3", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/adm_info#3" do
      assert {200, [%{"noAdministrador" => _} | _], _response} =
               adm_info(client, cnpj, contract_id)
    end
  end

  test "contract_category/3", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/contract_category#3" do
      assert {200, %{"categoria" => _}, _response} = contract_category(client, cnpj, contract_id)
    end
  end

  test "contract_postcards/4", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"

    use_cassette "contract/contract_postcards#4" do
      assert {200, %{"itens" => [%{"nuCartaoPostagem" => _} | _], "page" => _}, _response} =
               contract_postcards(client, cnpj, contract_id)
    end
  end

  test "contract_postcard/4", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"
    postcard_id = "0076056856"

    use_cassette "contract/contract_postcard#4" do
      assert {200, %{"nuCartaoPostagem" => ^postcard_id}, _response} =
               contract_postcard(client, cnpj, contract_id, postcard_id)
    end
  end

  test "contract_postcard_services/4", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"
    postcard_id = "0076056856"

    use_cassette "contract/contract_postcard_services#4" do
      assert {200, %{"itens" => [%{"codigo" => _} | _], "page" => _}, _response} =
               contract_postcard_services(client, cnpj, contract_id, postcard_id)
    end
  end

  test "contract_postcard_service/5", %{client: client} do
    cnpj = "29442979000130"
    contract_id = "9912515762"
    postcard_id = "0076056856"
    service_code = "03298"

    use_cassette "contract/contract_postcard_service#5" do
      assert {200, %{"codigo" => ^service_code}, _response} =
               contract_postcard_service(client, cnpj, contract_id, postcard_id, service_code)
    end
  end
end
