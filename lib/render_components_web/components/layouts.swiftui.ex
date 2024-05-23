defmodule RenderComponentsWeb.Layouts.SwiftUI do
  use RenderComponentsNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
