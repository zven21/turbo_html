defmodule Turbo.HTML.Form do
  @moduledoc """
  HTML serach form decorator.
  """

  use Phoenix.HTML

  @param_regex ~r{q\[([a-z1-9_]+)\]}

  @doc """
  Returns the search value decorator input tag.

  ## Example

      iex> conn = %{params: %{"q" => %{"name_like" => "a", "title_like" => "b"}}}
      iex> Turbo.HTML.Form.turbo_search_input(conn, "q[name_like]")
      {:safe, []}

  """
  @spec turbo_search_input(Map.t(), String.t(), Keyword.t()) :: any()
  def turbo_search_input(conn, field, opts \\ []) do
    @param_regex
    |> Regex.run(field)
    |> do_turbo_search_input(conn, field, opts)
  end


  defp do_turbo_search_input([_, match_param], %{params: %{"q" => query_params}}, field, opts) do
    value = Map.get(query_params, match_param, "")

    content_tag(:input, "",
      name: field, value: value,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end

  defp do_turbo_search_input(nil, _, field, opts) do
    content_tag(:input, "",
      name: field,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end
end
