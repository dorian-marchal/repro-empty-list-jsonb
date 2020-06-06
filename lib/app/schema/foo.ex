defmodule App.Foo do
  use Ecto.Schema

  schema "foo" do
    embeds_many(:bars, __MODULE__.Bar, on_replace: :delete)
  end
end

defmodule App.Foo.Bar do
  use Ecto.Schema

  embedded_schema do
    field(:bar, :string)
  end
end
