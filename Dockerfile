
FROM elixir:1.10

COPY . /app

WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force && mix deps.get && mix compile
