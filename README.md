# Turbo.HTML

## Table of contents

* [Getting started](#getting-started)
* [Demo](#demo)
* [Credits](#credits)


## Getting started

`Turbo.HTML` is a [Turbo.Ecto](https://github.com/zven21/turbo_ecto) at Phoenix framework supported.

```elixir
def deps do
  [
    {:turbo_html, "~> 0.2.1"}
  ]
end
```

For use with Phoenix.HTML, configure the config/config.exs like the following:

```elixir
config :turbo_html, Turbo.HTML,
  view_style: :semantic    # default bootstrap.
```

Two methods are provided:

* `turbo_pagination_links`: for pagination view.
* `turbo_search_input`: for search input.

## Demo

The dummy app shows a simple turbo_ecto example.

Clone the repository.

```bash
https://github.com/zven21/turbo_ecto.git
```

Change directory

```bash
$ cd dummy
```

Run mix

```bash
$ mix deps.get && yarn --cwd=assets
```

Preparing database

```bash
$ mix ecto.setup
```

Start the Phoenix server

```bash
$ ./script/server
```

Open your browser, and visit `http://localhost:4000`

## Credits

* [scrivener_html](https://github.com/mgwidmann/scrivener_html) - Initial inspiration of this project.