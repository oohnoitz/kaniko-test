import Config

config :kaniko_test, Tpn.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base = System.get_env("SECRET_KEY_BASE")

config :kaniko_test, KanikoTestWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base
