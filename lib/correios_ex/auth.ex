defmodule CorreiosEx.Auth do
  import CorreiosEx, [:only, :post, 3]

  alias CorreiosEx.Client

  @base_path "/token/v1"

  @doc """
  Authenticates a user and returns an access token with limited scope.
  """
  @spec by_user(Client.t()) :: CorreiosEx.response()
  def by_user(client) do
    post("#{@base_path}/autentica", client, %{})
  end

  @doc """
  Authenticates using a contract and returns an access token.
  """
  @spec by_contract(Client.t(), map()) :: CorreiosEx.response()
  def by_contract(client, body) do
    post("#{@base_path}/autentica/contrato", client, body)
  end

  @doc """
  Authenticates using a postcard and returns an access token.
  """
  @spec by_postcard(Client.t(), map()) :: CorreiosEx.response()
  def by_postcard(client, body) do
    post("#{@base_path}/autentica/cartaopostagem", client, body)
  end
end
