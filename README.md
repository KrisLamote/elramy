# elramy
Docker environment for running **El**ixir applications connected with **Ra**bbitMQ and **My**SQL

The primary goals are currently:

* have the 3 components running and talking to each other
* define an efficient workflow for importing, running and modifying an elixir project
* swap in/out elixir/OTP versions to help migrating projects to the latest

## MySQL

* Connect to the running MySQL instance by connecting your client to localhost:33061
* any modifications make are retained as they are stored in the mysqldata volume

## Workflow

The basic idea is that you can plug any elixir version in and have it work with the mysql & rabbitmq components.

### iex & basic mix tasks

Interactive shell

```
docker run -it --rm elixir:latest iex
```

Create a new elixir project 'demo' with a supervision tree

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd):/usr/src/app -w /usr/src/app \
    elixir:latest mix new demo --sup
```

Install Hex locally

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd):/usr/src/app -w /usr/src/app \
    elixir:latest mix new demo --sup
```

Compile

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd)/demo:/usr/src/app -w /usr/src/app \
    elixir:latest mix compile
```

Interact with your demo app

```
docker run -it --rm --name=elixir \
    --network=elramy_ntwrk \
    -v $(pwd)/demo:/usr/src/app -w /usr/src/app \
    elixir:latest iex -S mix
```

etc..
Obviously this is a but clumier than running ```mix ..```, the idea add a bash file that can simplify this greatly.
