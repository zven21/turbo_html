defmodule Turbo.HTML.ThemeAdapter do
  @moduledoc """
  Turbo HTML theme adapter.

  ## Example

      iex> use Turbo.HTML.ThemeAdapter
      Turbo.HTML.ThemeAdapter.Bootstrap

  """

  defmacro __using__(_opts) do
    module = theme_adapter()

    quote do
      import unquote(module)
    end
  end

  def theme_adapter() do
    (Turbo.HTML.view_style() || :bootstrap)
    |> Atom.to_string()
    |> String.capitalize()
    |> (&("Elixir.Turbo.HTML.ThemeAdapter." <> &1)).()
    |> String.to_atom()
  end
end
