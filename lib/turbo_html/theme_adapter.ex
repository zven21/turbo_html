defmodule Turbo.HTML.ThemeAdapter do
  @moduledoc false

  defmacro __using__(_opts) do
    module = theme_adapter()

    quote do
      import unquote(module)
    end
  end

  def theme_adapter() do
    (Turbo.HTML.default_theme() || :bootstrap)
    |> Atom.to_string()
    |> String.capitalize()
    |> (&("Elixir.Turbo.HTML.ThemeAdapter." <> &1)).()
    |> String.to_atom()
  end
end
