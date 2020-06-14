defmodule KanikoTest.Repo do
  use Ecto.Repo,
    otp_app: :kaniko_test,
    adapter: Ecto.Adapters.Postgres
end
