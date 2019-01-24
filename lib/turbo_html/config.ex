defmodule Turbo.HTML.Config do
  @moduledoc false

  def view_style(application \\ :turbo_html) do
    config(:view_style, :bootstrap, application)
  end

  defp config(application) do
    Application.get_env(application, Turbo.HTML, [])
  end

  defp config(key, default, application) do
    application
    |> config()
    |> Keyword.get(key, default)
    |> resolve_config(default)
  end

  defp resolve_config(value, _default), do: value
end
