# Erlserver

My attempt to create an Elixir server that can serve Rack applications.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add erlserver to your list of dependencies in `mix.exs`:

        def deps do
          [{:erlserver, "~> 0.0.1"}]
        end

  2. Ensure erlserver is started before your application:

        def application do
          [applications: [:erlserver]]
        end

