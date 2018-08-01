defmodule Turbo.HTML.Form do
  @moduledoc """
  serach form decorator
  """

  use Phoenix.HTML

  def turbo_search_input(conn, field, opts \\ []) do
    value =
      conn.params
      |> Plug.Conn.Query.encode()
      |> String.split(field <> "=")
      |> tl()
      |> Enum.at(0)

    content_tag(:input, "",
      name: field, value: value,
      class: Keyword.get(opts, :class),
      placeholder: Keyword.get(opts, :placeholder)
    )
  end
end
