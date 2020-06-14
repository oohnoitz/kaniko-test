FROM elixir:1.10.2

ENV MIX_ENV="prod" \
  PORT="5000"

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  apt-utils nodejs postgresql-client && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

# install hex + rebar
RUN mix local.hex --force && \
  mix local.rebar --force

# install mix dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get
RUN mix deps.compile

# build assets
COPY assets assets
RUN cd assets && npm ci && npm run deploy
RUN mix phx.digest

# build project
COPY priv priv
COPY lib lib
RUN mix compile

# build release
COPY rel rel
RUN mix release

# The command to run when this image starts up
CMD ["_build/prod/rel/kaniko_test/bin/kaniko_test", "start"]

