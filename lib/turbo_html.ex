defmodule Turbo.HTML do
  @moduledoc """
  Turbo view support.
  """

  alias Turbo.HTML.{Form, Paginate}

  @doc """
  paginate View
  """
  def turbo_pagination_links(paginator) do
    Paginate.turbo_pagination_links(paginator)
  end

  @doc """
  decorator paginate params.
  """
  def decorator_paginate(conn, paginate) do
    Map.merge(paginate, %{path_info: conn.path_info, params: conn.params})
  end

  @doc """
  decorator input view.
  """
  def turbo_search_input(conn, field, opts) do
    Form.turbo_search_input(conn, field, opts)
  end
end
