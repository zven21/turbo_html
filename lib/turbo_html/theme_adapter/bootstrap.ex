defmodule Turbo.HTML.ThemeAdapter.Bootstrap do
  @moduledoc """
  Boostrap Theme.
  """

  defmacro pagination_links(do: expression) do
    quote do
      Phoenix.HTML.Tag.content_tag :nav, "aria-label": "..." do
        Phoenix.HTML.Tag.content_tag :ul, class: "pagination" do
          unquote(expression)
        end
      end
    end
  end

  defmacro page_link(url, :disabled, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li, class: "page-item disabled" do
        Phoenix.HTML.Link.link to: unquote(url), class: "page-link", tabindex: -1 do
          unquote(text)
        end
      end
    end
  end

  defmacro page_link(url, :active, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li, class: "page-item active" do
        Phoenix.HTML.Link.link to: unquote(url), class: "page-link" do
          [
            Phoenix.HTML.html_escape(unquote(text))
          ]
        end
      end
    end
  end

  defmacro page_link(url, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li, class: "page-item" do
        Phoenix.HTML.Link.link to: unquote(url), class: "page-link" do
          Phoenix.HTML.html_escape(unquote(text))
        end
      end
    end
  end
end
