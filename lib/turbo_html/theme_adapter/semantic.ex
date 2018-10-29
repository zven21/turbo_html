defmodule Turbo.HTML.ThemeAdapter.Semantic do
  @moduledoc """
  Semantic Theme.
  """

  defmacro pagination_links(do: expression) do
    quote do
      Phoenix.HTML.Tag.content_tag :div, class: "ui pagination menu" do
        unquote(expression)
      end
    end
  end

  defmacro page_link(url, :disabled, do: text) do
    quote do
      Phoenix.HTML.Link.link to: unquote(url), class: "disabled item" do
        unquote(text)
      end
    end
  end

  defmacro page_link(url, :active, do: text) do
    quote do
      Phoenix.HTML.Link.link to: unquote(url), class: "active item" do
        unquote(text)
      end
    end
  end

  defmacro page_link(url, do: text) do
    quote do
      Phoenix.HTML.Link.link to: unquote(url), class: "item" do
        unquote(text)
      end
    end
  end
end
