defmodule CorreiosEx.Cost do
  import CorreiosEx, [:only, :get, :post, 3]

  alias CorreiosEx.Client

  @base_path "/preco/v1"

  @spec national(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def national(client, service_code, params) do
    get("#{@base_path}/nacional/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @spec national(Client.t(), map()) :: CorreiosEx.response()
  def national(client, body) do
    post("#{@base_path}/nacional", client, body)
  end

  @spec international(Client.t(), String.t(), map()) :: CorreiosEx.response()
  def international(client, service_code, params) do
    get("#{@base_path}/internacional/#{service_code}?#{URI.encode_query(params)}", client)
  end

  @spec international(Client.t(), map()) :: CorreiosEx.response()
  def international(client, body) do
    post("#{@base_path}/internacional", client, body)
  end
end
