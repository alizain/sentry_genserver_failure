defmodule SentryGenserverFailure.Repo do
  use Ecto.Repo,
    otp_app: :sentry_genserver_failure,
    adapter: Ecto.Adapters.Postgres
end
