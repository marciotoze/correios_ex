defmodule CorreiosEx.Client do
  defstruct auth: nil, endpoint: "https://api.correios.com.br"

  @type auth :: %{user: binary, password: binary} | %{access_token: binary}
  @type t :: %__MODULE__{auth: auth | nil, endpoint: binary}

  @spec new(auth()) :: t()
  def new(%{user: _, api_code: _} = auth) do
    %__MODULE__{auth: auth}
  end

  def new(%{access_token: _} = auth) do
    %__MODULE__{auth: auth}
  end

  @spec new(auth(), binary()) :: t()
  def new(%{user: _, api_code: _} = auth, endpoint) do
    %__MODULE__{auth: auth, endpoint: endpoint}
  end

  def new(%{access_token: _} = auth, endpoint) do
    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
