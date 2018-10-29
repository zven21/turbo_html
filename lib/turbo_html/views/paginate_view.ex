defmodule Turbo.HTML.Views.PaginateView do
  @moduledoc false

  use Turbo.HTML.ThemeAdapter
  # use Turbo.HTML.BootstrapAdapter
  # import Turbo.HTML.BootstrapAdapter
  # 1 Adapter
  # 2 Style Imporve
  # 3 moduledoc
  # 4 default_opts
  # 5

  # @raw_defaults [
  #   distance: 5,
  #   next: ">>",
  #   prev: "<<",
  #   first: true,
  #   last: true,
  #   ellipsis: raw("&hellip;")
  # ]

  # paginate: %{
  #   current_page: 10,
  #   next_page: 11,
  #   per_page: 5,
  #   prev_page: 9,
  #   total_count: 100,
  #   total_pages: 20
  # }

  def pagination_links(conn, paginate, opts \\ []) do
    pagination_links do
      [first_page_link(conn, paginate, opts)] ++
        [previous_page_link(conn, paginate, opts)] ++
        middle_page_links(conn, paginate, opts) ++
        [next_page_link(conn, paginate, opts)] ++ [last_page_link(conn, paginate, opts)]
    end
  end

  defp first_page_link(conn, paginate, opts) do
    label = opts[:first_label] || "First"

    current_page = paginate.current_page

    case current_page == 1 do
      true ->
        page_link("#", :disabled, do: label)

      false ->
        page_link(path_info(conn, 1), do: label)
    end
  end

  defp previous_page_link(conn, paginate, opts) do
    label = opts[:pervious_label] || "Pervious"
    current_page = paginate.current_page
    prev_page = paginate.prev_page

    case current_page <= 1 do
      true ->
        page_link("#", :disabled, do: label)

      false ->
        page_link(path_info(conn, prev_page), do: label)
    end
  end

  defp middle_page_links(conn, paginate, opts) do
    current_page = paginate.current_page
    max_page = paginate.total_pages
    max_page_links = opts[:max_page_links] || 5

    lower_limit =
      cond do
        current_page <= div(max_page_links, 2) ->
          1

        current_page >= max_page - div(max_page_links, 2) ->
          Enum.max([0, max_page - max_page_links]) + 1

        true ->
          current_page - div(max_page_links, 2)
      end

    upper_limit = lower_limit + max_page_links - 1

    Enum.map(lower_limit..upper_limit, fn page_num ->
      cond do
        current_page == page_num ->
          page_link("#", :active, do: page_num)

        page_num > max_page ->
          ""

        true ->
          page_link(path_info(conn, page_num), do: page_num)
      end
    end)
  end

  defp next_page_link(conn, paginate, opts) do
    label = opts[:next_label] || "Next"
    current_page = paginate.current_page
    next_page = paginate.next_page
    max_page = paginate.total_pages

    case current_page >= max_page do
      true ->
        page_link("#", :disabled, do: label)

      false ->
        page_link(path_info(conn, next_page), do: label)
    end
  end

  defp last_page_link(conn, paginate, opts) do
    current_page = paginate.current_page
    max_page = paginate.total_pages
    label = opts[:last_label] || "Last"

    case current_page == max_page do
      true ->
        page_link("#", :disabled, do: label)

      false ->
        page_link(path_info(conn, current_page + 1), do: label)
    end
  end

  defp path_info(conn, page_number) do
    params = Map.put(conn.params, "page", page_number)
    Path.join(["/" | conn.path_info]) <> "?" <> Plug.Conn.Query.encode(params)
  end
end
