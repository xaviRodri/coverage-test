defmodule CoverageTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CoverageTestWeb.Telemetry,
      # Start the Ecto repository
      CoverageTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CoverageTest.PubSub},
      # Start Finch
      {Finch, name: CoverageTest.Finch},
      # Start the Endpoint (http/https)
      CoverageTestWeb.Endpoint
      # Start a worker by calling: CoverageTest.Worker.start_link(arg)
      # {CoverageTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CoverageTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CoverageTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
