# elramy
Docker environment for running **El**ixir applications connected with **Ra**bbitMQ and **My**SQL

The primary goals are currently:

* have the 3 components running and talking to each other
* define an efficient workflow for importing, running and modifying an elixir project
* swap in/out elixir/OTP versions to help migrating projects to the latest

## MySQL

* Connect to the running MySQL instance by connecting your client to localhost:33061
* any modifications make are retained as they are stored in the mysqldata volume
