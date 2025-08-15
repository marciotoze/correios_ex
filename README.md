# README

<h2 align="center">
  <br>
  <a href="https://github.com/marciotoze/correios_ex"><img src="docs/images/correios_ex_logo.png" alt="Correios Ex Logo" width="300"></a>

  Correios Ex
</h2>

<h4 align="center">A Correios API wrapper.</h4>

## Getting Started

### Installation

```elixir
def deps do
  [
    {:correios_ex, "~> 0.1.0"}
  ]
end
```

### Authentication by Postcard

```elixir
# Create a client with your credentials
client = CorreiosEx.Client.new(
  %{
    user: "your_user",
    api_code: "your_api_code"
  }
)

# Authenticate using a postcard number
{status, response, _} = CorreiosEx.Auth.by_postcard(client, %{"numero" => "0073249300"})

# The response will contain:
# %{"token" => "...", "expiraEm" => "...", "cartaoPostagem" => "..."}
```

### Cost Calculation

```elixir

client = CorreiosEx.Client.new(%{access_token: <token>})

# Calculate shipping cost for a single package (national)
params = %{
  cepDestino: "71930000",    # Destination ZIP code
  cepOrigem: "70902000",     # Origin ZIP code
  psObjeto: 300              # Weight in grams
}

service_code = "04162"  # PAC service code

{status, response, _} = CorreiosEx.Cost.national(client, service_code, params)

# The response will contain:
# %{"pcFinal" => "12,50", ...}  # Final price and other cost details
```



## Correios API coverage:

that is (almost) the priority order that we should implement this API

- [x] Token
- [x] Prazo v3
- [x] Preço v3
- [ ] Meu Contrato
- [ ] CEP v3
- [ ] Agência v2
- [ ] Pré-postagem
- [ ] Webhook
- [ ] AR Eletrônico
- [ ] Faturas
- [ ] País v3
- [ ] Token - Certificado
- [ ] SRO - Interatividade
- [ ] SRO - Rastro
- [ ] Internacional - Packet
- [ ] Mensagem Digital - Ext

Disclaimer: this wrapper was heavily inspired by <a href="https://github.com/edgurgel/tentacat">Tentacat</a>