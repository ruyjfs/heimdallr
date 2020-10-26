# Heimdallr (Your best Sigle Sign On with Elixir and JWT)

## Run app

### On local development

> Observation! <br />
> If are using VSCode and extension ElixirLS: Elixir support and debugger.
> Make sure to disable this configuration. This get deps of your OS and replace of docker container, causing error of system.

```
Elixir LS: Fetch Deps
- [ ] Automatically fetch project dependencies when compiling
```

<!-- ### One command for run

```sh
  docker-compose up --build
```

> Open browser on: <localhost:4000>

### Enter to container

```
docker exec -it heimdallr-api /bin/sh
``` -->

### Run just DB

```sh
docker-compose -f db.yml up --build
```

### Install dependencies

```sh
mix deps.get && cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development && cd ../
```

### Run locally without Docker

```sh
mix start
```

> Need a Database <br />
> Open browser on: <localhost:4000>

### Run any command on container docker

Like ecto.migrate, to migrate database structure

```sh
docker exec -it heimdallr-api mix ecto.migrate
```

### Run just a container without docker-compose, just a single container

```powershell
docker run -it --rm --name elixir -p 4000:4000 -v "\$PWD":"/var/www" -w "/var/www" elixir:slim /bin/bash
```

To enter on this container

```powershell
docker attach elixir
```

## Another commands

```sh
MIX_ENV=dev mix phx.server # Run app with configuration for env.

iex -S mix phx.server #Run a IEX - CLI command of Elixir

mix phx.gen.context UserManager User users username:string password:string

mix local.hex --force

mix archive.install hex phx --force

mix archive.install hex phx_new --force


mix phx.gen.schema User users name:string email:string \
bio:string number_of_pets:integer
```

### DB Commands

```sh
mix ecto.create #create database, run it on beginning of project.

mix ecto.gen.migration create_people # Generate a migrate for table

mix ecto.migrate # Migrate to DB existing migrate on project

```

### Comands to create this project

```sh

mix phx.new heimdallr --no-html --no-webpack # with html and webpack

mix phx.new heimdallr --no-html --no-webpack # not have html and webpack

cd heimdallr # Enter on project path

mix phx.server # Run phoenix framework server

mix archive.install hex absinthe

mix archive.install hex absinthe_plug absinthe_ecto --force

mix archive.install hex comeonin

mix ecto.create

mix deps.get
```

### Powered By:

- Elixir (Language)
- Pheonix (Framework)
- Guardian (Auth)
- Absynt (GraphQL)
- Ecto (ORM)
- Mix (Package Manager)
- PostgreSQL (SGBD)
- JWT / SSO
- Socket.IO (Assync)

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
