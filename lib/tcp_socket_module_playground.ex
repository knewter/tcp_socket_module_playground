defmodule TCPSocketModulePlayground do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    port = Application.get_env(:tcp_socket_module_playground, :server)[:port]

    children = [
      # Define workers and child supervisors to be supervised
      worker(Task, [TCPSocketModulePlayground.Server, :accept, [port]])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TCPSocketModulePlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
