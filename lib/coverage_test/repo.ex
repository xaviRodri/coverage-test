defmodule CoverageTest.Repo do
  use Ecto.Repo,
    otp_app: :coverage_test,
    adapter: Ecto.Adapters.Postgres
end
