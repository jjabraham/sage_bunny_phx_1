defmodule SageBunnyPhx1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SageBunnyPhx1.Repo,
      # Start the Telemetry supervisor
      SageBunnyPhx1Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: SageBunnyPhx1.PubSub},
      # Start the Endpoint (http/https)
      SageBunnyPhx1Web.Endpoint
      # Start a worker by calling: SageBunnyPhx1.Worker.start_link(arg)
      # {SageBunnyPhx1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SageBunnyPhx1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SageBunnyPhx1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
