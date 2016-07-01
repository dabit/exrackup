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
      supervisor(Task.Supervisor, [[name: Exrackup.TaskSupervisor]]),
      worker(Task, [Exrackup.Server, :accept, [4001]])
    ]

    opts = [strategy: :one_for_one, name: Exrackup.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
