defmodule CorreiosEx.Cost do
  import CorreiosEx, [:only, :get, :post, 3]

  alias CorreiosEx.Client

  @base_path "/preco/v1"

  @doc """
  Calculates national shipping cost for a single package using GET request.
  """
  @spec national(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def national(client, service_code, params) do
    get("#{@base_path}/nacional/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @doc """
  Calculates national shipping cost for multiple packages using POST request.
  """
  @spec national(Client.t(), map()) :: CorreiosEx.response()
  def national(client, body) do
    post("#{@base_path}/nacional", client, body)
  end

  @doc """
  Calculates international shipping cost for a single package using GET request.
  """
  @spec international(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def international(client, service_code, params) do
    get("#{@base_path}/internacional/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @doc """
  Calculates international shipping cost for multiple packages using POST request.
  """
  @spec international(Client.t(), map()) :: CorreiosEx.response()
  def international(client, body) do
    post("#{@base_path}/internacional", client, body)
  end
end
