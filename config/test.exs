import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :render_components, RenderComponentsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CpcmKCeTZCr/3rlNxGaIdVyFQ2F8E5zi6OkIWNu6TUoCyDmm5XdzaJJ5gvhS/qqM",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
