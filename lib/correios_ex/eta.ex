defmodule CorreiosEx.ETA do
  import CorreiosEx, [:only, :get, :post, 3]

  alias CorreiosEx.Client

  @doc """
  Calculates national shipping ETA for a single package using a GET request.
  """
  @spec national(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def national(client, service_code, params) do
    get("/prazo/v1/nacional/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @doc """
  Calculates national shipping ETA for multiple packages using a POST request.
  """
  @spec national(Client.t(), map()) :: CorreiosEx.response()
  def national(client, body) do
    post("/prazo/v1/nacional", client, body)
  end

  @doc """
  Calculates international import shipping ETA for a single package using a GET request.
  """
  @spec international_import(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def international_import(client, service_code, params) do
    get("/prazo/v2/internacional/importacao/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @doc """
  Calculates international export shipping ETA for a single package using a GET request.
  """
  @spec international_export(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def international_export(client, service_code, params) do
    get("/prazo/v2/internacional/exportacao/#{service_code}?#{URI.encode_query(params)}", client)
  end
end
