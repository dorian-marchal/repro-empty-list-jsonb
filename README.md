# Repro for [this thread](https://elixirforum.com/t/how-to-insert-an-empty-list-in-a-jsonb-column/32137)

```sh
git clone https://github.com/dorian-marchal/repro-empty-list-jsonb
cd repro-empty-list-jsonb
docker-compose up --build -d
docker-compose exec app bash
```

Inside the container:

```shell
mix ecto.create && mix ecto.migrate
iex -S mix
```

IEx session:

```
iex(1)> %App.Foo{}.bars
[]

iex(2)> %App.Foo{} |> App.Repo.insert()
[debug] QUERY ERROR db=5.5ms queue=1.0ms idle=1938.1ms
INSERT INTO "foo" VALUES (DEFAULT) RETURNING "id" []
** (Postgrex.Error) ERROR 23502 (not_null_violation) null value in column "bars" violates not-null constraint

    table: foo
    column: bars

Failing row contains (1, null).

iex(3)> %App.Foo{bars: []} |> App.Repo.insert()
[debug] QUERY ERROR db=5.5ms queue=1.0ms idle=1938.1ms
INSERT INTO "foo" VALUES (DEFAULT) RETURNING "id" []
** (Postgrex.Error) ERROR 23502 (not_null_violation) null value in column "bars" violates not-null constraint

    table: foo
    column: bars

Failing row contains (1, null).
```
