defmodule TCPSocketModulePlayground.Runner do
  use GenServer

  def start_link(socket) do
    GenServer.start_link(__MODULE__, socket)
  end

  def init(socket) do
    :inet.setopts(socket, active: :once)
    {:ok, socket}
  end

  def handle_info({:tcp, _port, message}, socket) do
    :gen_tcp.send(socket, String.upcase(message))
    :inet.setopts(socket, active: :once)
    {:noreply, socket}
  end

  def handle_info(foo, socket) do
    IO.puts "unknown: #{inspect foo}"
    {:noreply, socket}
  end
end
