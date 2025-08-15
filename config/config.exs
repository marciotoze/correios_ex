import Config

if config_env() == :test do
  config :exvcr,
    vcr_cassette_library_dir: "test/fixture/vcr_cassettes",
    filter_sensitive_data: [
      [pattern: "Bearer\\s.+", placeholder: "Bearer <ACCESS_TOKEN>"],
      [pattern: "Basic\\s.+", placeholder: "Basic <BASIC_TOKEN>"],
      [pattern: ~S/"token":"[^"]+"/, placeholder: "\"token\":\"<TOKEN>\""],
      [pattern: ~S/"cnpj":"[^"]+"/, placeholder: "\"cnpj\":\"<CNPJ>\""],
      [pattern: ~S/"id":"[^"]+"/, placeholder: "\"id\":\"<ID>\""]
    ],
    filter_request_headers: ["Authorization"]

  import_config "config.secret.exs"
end
