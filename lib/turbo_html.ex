defmodule Turbo.HTML do
  @moduledoc """
  Turbo view support.
  """

  alias Turbo.HTML.Views.{
    PaginateView,
    SearchInputView
  }

  alias Turbo.HTML.Config, as: TConfig

  @doc """
  paginate view
  """
  def turbo_pagination_links(conn, paginate, opts \\ []) do
    PaginateView.pagination_links(conn, paginate, opts)
  end

  @doc """
  search input view.
  """
  def turbo_search_input(conn, field, opts \\ []) do
    SearchInputView.search_input(conn, field, opts)
  end

  def view_style do
    TConfig.view_style()
  end
end
