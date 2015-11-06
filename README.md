# TCPSocketModulePlayground

This is a slightly less basic TCP server that hands off each connection to a
runner.  This project exists as an example for
[ElixirSips](http://www.elixirsips.com) Episode 205 - The Opposite of Mocks.

You should be able to clone this app and run it with:

```sh
iex -S mix
```

At that point, the app is running on port 8112 (or whatever is setup in the
config/config.exs file).  You can open a TCP connection to it, and it will be a
basic upcasing echo TCP server.
