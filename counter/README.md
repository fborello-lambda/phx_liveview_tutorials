# Counter

This is a simple counter app using Phoenix's LiveView Components.

## How to use?

Install elixir, erlang and phoenix.

Get the deps:
```sh
mix deps.get
```

Create a `.env` file and add the following:

```sh
export MIX_ENV=prod
export PHX_SERVER=true
export SECRET_KEY_BASE=`mix phx.gen.secret`
```

And to export them: 

```sh
source .env
```

Run the compilation and then run the binary:

```sh
make compile
make run 
```

## Config for public Deployment

Counter App Error →

Solution for the following error:

```bash
17:08:15.791 [error] Could not check origin for Phoenix.Socket transport.

Origin of the request: http://<public_ip>:4000

This happens when you are attempting a socket connection to
a different host than the one configured in your config/
files. For example, in development the host is configured
to "localhost" but you may be trying to access it from
"127.0.0.1". To fix this issue, you may either:

  1. update [url: [host: ...]] to your actual host in the
     config file for your current environment (recommended)

  2. pass the :check_origin option when configuring your
     endpoint or when configuring the transport in your
     UserSocket module, explicitly outlining which origins
     are allowed:

        check_origin: ["https://example.com",
                       "//another.com:888", "//other.com"]

17:08:24.680 [error] Could not check origin for Phoenix.Socket transport.

Origin of the request: http://<public_ip>:4000

This happens when you are attempting a socket connection to
a different host than the one configured in your config/
files. For example, in development the host is configured
to "localhost" but you may be trying to access it from
"127.0.0.1". To fix this issue, you may either:

  1. update [url: [host: ...]] to your actual host in the
     config file for your current environment (recommended)

  2. pass the :check_origin option when configuring your
     endpoint or when configuring the transport in your
     UserSocket module, explicitly outlining which origins
     are allowed:

        check_origin: ["https://example.com",
                       "//another.com:888", "//other.com"]
```

In `config\runtime.exs` , the `port:` parameter isn’t needed, the app uses `4000`. And the important part, the `host` parameter needs brackets → `[host: host]` to work and the `PHX_HOST` env variable doesn’t have to be set, so that “0.0.0.0” is truthy and used as host:

```elixir
#[...]
host = System.get_env("PHX_HOST") || "0.0.0.0"
port = String.to_integer(System.get_env("PORT") || "4000")

config :counter, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

config :counter, CounterWeb.Endpoint,
  url: [[host: host], scheme: "http"],
  http: [
    # Enable IPv6 and bind on all interfaces.
    # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
    # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
    # for details about using IPv6 vs IPv4 and loopback vs public addresses.
    ip: {0, 0, 0, 0, 0, 0, 0, 0},
    port: port
  ],
  secret_key_base: secret_key_base
#[...]
```

Now the app can be accessed with `localhost:4000` and `public_ip:4000`
