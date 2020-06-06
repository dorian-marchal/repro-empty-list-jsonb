defmodule App.Repo.Migrations.Foo do
  use Ecto.Migration

  def change do
    create table(:foo) do
      add(:bars, :map, null: false)
    end
  end
end
