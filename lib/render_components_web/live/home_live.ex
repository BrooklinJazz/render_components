defmodule RenderComponentsWeb.HomeLive do
  use RenderComponentsWeb, :live_view
  use RenderComponentsNative, :live_view

  use LiveViewNative.LiveView,
    formats: [:swiftui],
    layouts: [
      swiftui: {RenderComponentsWeb.Layouts.SwiftUI, :app}
    ]

  def render(assigns), do: ~H""
end
