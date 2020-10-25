# Heimdallr (Your best Sigle Sign On with Elixir and JWT)

### Powered By:

- Elixir (Language)
- Pheonix (Framework)
- Absynt (GraphQL)
- Ecto (ORM)
- Mix (Package Manager)
- PostgreSQL (SGBD)
- JWT / SSO
- Socket.IO (Assync)

### Run app

```
docker-compose up
```

### Enter to container

```
docker exec -it heimdallr-api /bin/sh
```

### Run migrate

```
docker exec -it heimdallr-api mix ecto.migrate
```

docker run -it --rm --name elixir -p 4000:4000 -v "\$PWD":"/var/www" -w "/var/www" elixir:slim /bin/bash

mix phx.gen.context UserManager User users username:string password:string

mix local.hex --force

mix archive.install hex phx --force

mix archive.install hex phx_new --force

mix phx.new heimdallr --no-html --no-webpack

cd heimdallr

mix phx.server

mix archive.install hex absinthe

mix archive.install hex absinthe_plug absinthe_ecto --force

mix archive.install hex comeonin

mix ecto.create

mix deps.get

mix phx.gen.schema User users name:string email:string \
bio:string number_of_pets:integer

Create DB
mix ecto.create

mix ecto.gen.migration create_people

mix ecto.migrate

MIX_ENV=dev mix phx.server

## Run with docker

```
  docker-compose up
```

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
