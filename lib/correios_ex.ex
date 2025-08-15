defmodule CorreiosEx do
  use HTTPoison.Base

  alias CorreiosEx.Client
  alias Jason

  @type response :: {integer, any, HTTPoison.Response.t()}

  @user_agent [{"User-agent", "correios_ex"}]
  @default_headers [{"Content-Type", "application/json"}]

  @spec process_response_body(binary) :: term
  def process_response_body(""), do: nil
  def process_response_body(body), do: Jason.decode!(body)

  @spec process_response(HTTPoison.Response.t()) :: response
  def process_response(%HTTPoison.Response{status_code: status_code, body: body} = resp),
    do: {status_code, body, resp}

  @spec delete(binary, Client.t(), any) :: response
  def delete(path, client, body \\ "") do
    _request(:delete, url(client, path), client.auth, body)
  end

  @spec post(binary, Client.t(), any) :: response
  def post(path, client, body \\ "") do
    _request(:post, url(client, path), client.auth, body)
  end

  @spec patch(binary, Client.t(), any) :: response
  def patch(path, client, body \\ "") do
    _request(:patch, url(client, path), client.auth, body)
  end

  @spec put(binary, Client.t(), any) :: response
  def put(path, client, body \\ "") do
    _request(:put, url(client, path), client.auth, body)
  end

  @spec get(binary, Client.t()) :: response
  def get(path, client) do
    _request(:get, url(client, path), client.auth)
  end

  @spec _request(atom, binary, Client.auth(), any) :: response
  def _request(method, url, auth, body \\ "", options \\ []) do
    request!(
      method,
      url,
      Jason.encode!(body),
      authorization_header(auth, @user_agent) ++ @default_headers,
      options
    )
  end

  @spec url(client :: Client.t(), path :: binary) :: binary
  defp url(_client = %Client{endpoint: endpoint}, path) do
    endpoint <> path
  end

  @spec authorization_header(Client.auth(), list) :: list
  def authorization_header(%{user: user, api_code: api_code}, headers) do
    userpass = "#{user}:#{api_code}"
    headers ++ [{"Authorization", "Basic #{:base64.encode(userpass)}"}]
  end

  def authorization_header(%{access_token: token}, headers) do
    headers ++ [{"Authorization", "token #{token}"}]
  end
end
