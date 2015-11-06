defmodule TCPSocketModulePlayground.Server do
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, active: false, reuseaddr: true])
    acceptor_loop(socket)
  end

  defp acceptor_loop(socket) do
    case socket |> :gen_tcp.accept do
      {:ok, client} ->
        {:ok, runner} = TCPSocketModulePlayground.Runner.start_link(client)
        :ok = :gen_tcp.controlling_process(client, runner)
        acceptor_loop(socket)
      {:error, :closed} ->
        acceptor_loop(socket)
      {:error, _} ->
        {:stop, :error, []}
    end
  end
end
