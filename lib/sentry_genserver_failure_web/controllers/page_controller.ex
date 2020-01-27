defmodule SentryGenserverFailureWeb.PageController do
  use SentryGenserverFailureWeb, :controller

  def index(conn, _params) do
    SentryGenserverFailure.Stack.push(1)
    render(conn, "index.html")
  end
end
