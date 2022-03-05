defmodule Turbo.HTML.Views.SearchInputView do
  @moduledoc false

  use Phoenix.HTML

  @param_regex ~r{q\[([\S]+)\]}

  @doc """
  """
  @spec search_input(Map.t(), String.t(), Keyword.t()) :: any
  def search_input(conn, field, opts) do
    @param_regex
    |> Regex.run(field)
    |> do_search_input(conn, field, opts)
  end

  defp do_search_input([_, match_param], %{params: %{"q" => query_params}}, field, opts) do
    value = Map.get(query_params, match_param, "")

    content_tag(:input, "",
      name: field,
      value: value,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder),
      type: Keyword.get(opts, :type, "text")
    )
  end

  defp do_search_input(_, _, field, opts) do
    content_tag(:input, "",
      name: field,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder),
      type: Keyword.get(opts, :type, "text")
    )
  end
end
