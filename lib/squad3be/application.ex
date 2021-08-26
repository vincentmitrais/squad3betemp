defmodule Squad3be.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Squad3be.Repo,
      # Start the Telemetry supervisor
      Squad3beWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Squad3be.PubSub},
      # Start the Endpoint (http/https)
      Squad3beWeb.Endpoint
      # Start a worker by calling: Squad3be.Worker.start_link(arg)
      # {Squad3be.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Squad3be.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Squad3beWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
