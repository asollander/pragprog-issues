import Config

config :issues, Github, url: "https://api.github.com"

config :logger,
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]
