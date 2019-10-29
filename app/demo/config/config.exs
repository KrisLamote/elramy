use Mix.Config

config :demo, Demo.Repo,
       adapter: Ecto.Adapters.MySQL,
       database: "elramy_db",
       username: "elramy",
       password: "elramy_pwd",
       hostname: "mysql"

config :demo, ecto_repos: [Demo.Repo]
