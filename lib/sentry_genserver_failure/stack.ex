defmodule SentryGenserverFailure.Stack do
  use GenServer

  # Client

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def push(element) do
    GenServer.call(__MODULE__, {:push, element})
  end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call({:push, element}, _from, state) do
    # NOTE: MatchError occurs below
    %{some: nil} = element
    {:noreply, [element | state]}
  end
end
