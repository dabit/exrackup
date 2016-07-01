defmodule Exrackup do
  use Application
  use Export.Ruby

  def call do
    {:ok, ruby} = Ruby.start(ruby_lib: "./")
    ruby |> Ruby.call("lib/server", "call_that_method", [{}])
  end

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Task.Supervisor, [[name: Server.TaskSupervisor]]),
      worker(Task, [Server, :accept, [4001]])
    ]

    opts = [strategy: :one_for_one, name: Server.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
