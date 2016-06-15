defmodule Erlserver do
  use Export.Ruby

  def call do
    {:ok, ruby} = Ruby.start(ruby_lib: "./")
    ruby |> Ruby.call("lib/server", "call_that_method", [{}])
  end
end
