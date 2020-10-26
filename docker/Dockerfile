# FROM elixir:alpine
# RUN apk add make gcc libc-dev

FROM elixir:1.10-slim
RUN apt-get update && apt-get install -y make gcc libc-dev nodejs npm
RUN mix local.hex --force && mix archive.install hex phx_new --force
