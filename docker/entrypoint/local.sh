#!/bin/bash

# set -e
# rm -rf mix.lock && rm -rf _build/ && rm -rf deps
# echo "[ ****************** ] Starting Endpoint of Application [ ****************** ]"

# echo "Back - Starting Endpoint of Application"

if ! [ -d "./deps" ]; then
  echo " Install depedences whit composer..."
  mix deps.get --all

  # cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development && cd ../

  #   # mix local.hex
  echo "DB Migration"
  mix ecto.setup
  mix local.rebar --force
fi
# exec "$@"

# # set -- php-fpm

exec "$@"

# # mix deps.get --all

# # mix local.hex

# # mix ecto.create
# # mix ecto.setup
# # --deps
# # mix clean
# # mix phx.digest.clean
