# elramy

Docker environment for running **El**ixir applications connected with **Ra**bbitMQ and **My**SQL

The primary goals are currently:

- have the 3 components running and talking to each other
- define an efficient workflow for importing, running and modifying an elixir project
- swap in/out elixir/OTP versions to help migrating projects to the latest

## MySQL

- Connect to the running MySQL instance by connecting your client to localhost:33061
- any modifications make are retained as they are stored in the mysqldata volume

## Workflow

The basic idea is that you can plug any elixir version in and have it work with the mysql & rabbitmq components.

### iex & basic mix tasks

Interactive shell

```
docker run -it --rm elixir:latest iex
```

Create a new elixir project 'app' with a supervision tree

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd):/usr/src/app \
    -w /usr/src/app \
    elixir:latest mix new app --sup
```

Install Hex locally

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd):/usr/src/app \
    -w /usr/src/app \
    elixir:latest mix new app --sup
```

Compile

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd)/demo:/usr/src/app \
    -w /usr/src/app \
    elixir:latest mix compile
```

Interact with your demo app

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd)/demo:/usr/src/app \
    -w /usr/src/app \
    elixir:latest iex -S mix
```

## Workflow with .develop script

basic docker-compose shortcuts (with default env variables defined)

```
./develop        # ps is the default command, so same as doing: docker-compose ps
./develop up -d  # up all services, deamonize
./develop stop   # stop all services
```

common iex/mix stuff

```
./develop iex        # just start iex in an elixir contained, see ELX_VERSION
./develop iex -S mix # assume an app is created in all (see docker commands above)
./develop mix test   # runs test in the app project, etc..
```
