defmodule BanditSslTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, port: 4000, scheme: :https, certfile: "priv/cert/selfsigned.pem", keyfile: "priv/cert/selfsigned_key.pem", otp_app: :bandit_ssl_test}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BanditSslTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
