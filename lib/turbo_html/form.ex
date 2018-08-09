defmodule Turbo.HTML.Form do
  @moduledoc """
  HTML serach form decorator.
  """

  use Phoenix.HTML

  @doc """
  Returns the search value decorator input tag.

  ## Example

      iex> conn = %{params: %{"q" => %{"name_like" => "a", "title_like" => "b"}}}
      iex> Turbo.HTML.Form.turbo_search_input(conn, "name_like")
      {:safe, []}

  """
  @spec turbo_search_input(Map.t(), String.t(), Keyword.t()) :: any()
  def turbo_search_input(conn, field, opts \\ []), do: do_turbo_search_input(conn, field, opts)

  defp do_turbo_search_input(%{params: %{"q" => query_params}}, field, opts) do
    value = Map.get(query_params, field, "")

    content_tag(:input, "",
      name: field, value: value,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end

  defp do_turbo_search_input(_, field, opts) do
    content_tag(:input, "",
      name: field,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end
end
