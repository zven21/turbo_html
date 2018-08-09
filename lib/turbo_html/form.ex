defmodule Turbo.HTML.Form do
  @moduledoc """
  HTML serach form decorator.
  """

  use Phoenix.HTML

  @doc """
  Returns the search value decorator input tag.

  ## Example

      iex> conn = %{params: %{"name_like" => "a", "title_like" => "b"}}
      iex> Turbo.HTML.Form.turbo_search_input
      {:safe, []}

  """
  @spec turbo_search_input(Map.t(), String.t(), Keyword.t()) :: any()
  def turbo_search_input(conn, field, opts \\ []) do
    value = Map.get(conn.params, field, "")

    content_tag(:input, "",
      name: field, value: value,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end
end
