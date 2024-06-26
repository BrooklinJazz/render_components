# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :render_components,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :render_components, RenderComponentsWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: RenderComponentsWeb.ErrorHTML, json: RenderComponentsWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: RenderComponents.PubSub,
  live_view: [signing_salt: "Hv2xPvwj"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  render_components: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  render_components: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# LVN - Required
# Registers each available plugin
config :live_view_native, plugins: [
  LiveViewNative.SwiftUI
]

# LVN - Required
# Each format must be registered as a mime type add to
# existing configuration if one exists as this will overwrite
config :mime, :types, %{
  "text/swiftui" => ["swiftui", "styles"]
}

# LVN - Required
# Phoenix must know how to encode each LVN format
config :phoenix_template, :format_encoders, [
  swiftui: Phoenix.HTML.Engine
]

# LVN - Required
# Phoenix must know how to compile neex templates
config :phoenix, :template_engines, [
  neex: LiveViewNative.Engine
]

# LVN - Required
# You must configure LiveView Native Stylesheets
# on which file path patterns class names should be extracted from
config :live_view_native_stylesheet,
  content: [
    swiftui: [
      "lib/**/*swiftui*"
    ]
  ],
  output: "priv/static/assets"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
