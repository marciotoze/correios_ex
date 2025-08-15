defmodule CorreiosEx.Contract do
  import CorreiosEx, [:only, :get, :post, 3]

  alias CorreiosEx.Client

  @doc """
  Lists contracts for a given CNPJ.
  """
  @spec list(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def list(client, cnpj, params \\ %{}) do
    get("/meucontrato/v1/empresas/#{cnpj}/contratos?#{URI.encode_query(params)}", client)
  end

  @doc """
  Gets a contract by its ID.
  """
  @spec get(Client.t(), String.t(), String.t()) :: CorreiosEx.response()
  def get(client, cnpj, id) do
    get("/meucontrato/v1/empresas/#{cnpj}/contratos/#{id}", client)
  end

  @doc """
  Lists services for a given contract.
  """
  @spec services(Client.t(), String.t(), String.t()) :: CorreiosEx.response()
  def services(client, cnpj, contract_id, params \\ %{}) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/servicos?#{URI.encode_query(params)}",
      client
    )
  end

  @doc """
  Lists services for a given contract.
  """
  @spec service(Client.t(), String.t(), String.t(), String.t()) :: CorreiosEx.response()
  def service(client, cnpj, contract_id, service_code) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/servicos/#{service_code}",
      client
    )
  end

  @doc """
  Gets a manager for a given contract.
  """
  @spec manager_info(Client.t(), String.t(), String.t()) :: CorreiosEx.response()
  def manager_info(client, cnpj, contract_id) do
    get("/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/contatoGerencia", client)
  end

  @doc """
  Gets a administrator for a given contract.
  """
  @spec adm_info(Client.t(), String.t(), String.t()) :: CorreiosEx.response()
  def adm_info(client, cnpj, contract_id) do
    get("/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/contatoAcom", client)
  end

  @doc """
  Gets a contract category for a given contract.
  """
  @spec contract_category(Client.t(), String.t(), String.t()) :: CorreiosEx.response()
  def contract_category(client, cnpj, contract_id) do
    get("/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/categoria", client)
  end

  @doc """
  Lists postcards for a given contract.
  """
  @spec contract_postcards(Client.t(), String.t(), String.t(), map()) :: CorreiosEx.response()
  def contract_postcards(client, cnpj, contract_id, params \\ %{}) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/cartoes?#{URI.encode_query(params)}",
      client
    )
  end

  @doc """
  Gets a contract postcard by its ID.
  """
  @spec contract_postcard(Client.t(), String.t(), String.t(), String.t()) :: CorreiosEx.response()
  def contract_postcard(client, cnpj, contract_id, postcard_id) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/cartoes/#{postcard_id}",
      client
    )
  end

  @doc """
  Lists services for a given contract postcard.
  """
  @spec contract_postcard_services(Client.t(), String.t(), String.t(), String.t()) ::
          CorreiosEx.response()
  def contract_postcard_services(client, cnpj, contract_id, postcard_id) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/cartoes/#{postcard_id}/servicos",
      client
    )
  end

  @doc """
  Gets a service for a given contract postcard.
  """
  @spec contract_postcard_service(Client.t(), String.t(), String.t(), String.t(), String.t()) ::
          CorreiosEx.response()
  def contract_postcard_service(client, cnpj, contract_id, postcard_id, service_code) do
    get(
      "/meucontrato/v1/empresas/#{cnpj}/contratos/#{contract_id}/cartoes/#{postcard_id}/servicos/#{service_code}",
      client
    )
  end
end
