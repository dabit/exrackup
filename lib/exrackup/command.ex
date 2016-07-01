defmodule Exrackup.Command do
  @doc ~S"""
  Parses the given `line` into a command.

  ## Examples

    iex> Exrackup.Command.parse "CREATE shopping\r\n"
    {:ok, {:create, "shopping"}}

    iex> Exrackup.Command.parse "CREATE  shopping  \r\n"
    {:ok, {:create, "shopping"}}

    iex> Exrackup.Command.parse "PUT shopping milk 1\r\n"
    {:ok, {:put, "shopping", "milk", "1"}}

    iex> Exrackup.Command.parse "GET shopping milk\r\n"
    {:ok, {:get, "shopping", "milk"}}

    iex> Exrackup.Command.parse "DELETE shopping eggs\r\n"
    {:ok, {:delete, "shopping", "eggs"}}

    Unknown commands or commands with the wrong number of
    arguments return an error:

    iex> Exrackup.Command.parse "UNKNOWN shopping eggs\r\n"
    {:error, :unknown_command}

    iex> Exrackup.Command.parse "GET shopping\r\n"
    {:error, :unknown_command}

  """
  def parse(line) do
    case String.split(line) do
      ["CREATE", bucket] -> {:ok, {:create, bucket}}
      ["GET", bucket, key] -> {:ok, {:get, bucket, key}}
      ["PUT", bucket, key, value] -> {:ok, {:put, bucket, key, value}}
      ["DELETE", bucket, key] -> {:ok, {:delete, bucket, key}}
      _ -> {:error, :unknown_command}
    end
  end

  @doc """
  Runs the given command.
  """
  def run(command) do
    {:ok, "OK\r\n"}
  end
end
