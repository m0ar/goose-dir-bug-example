Goose will not apply/rollback migrations in directories indicated by the
`-dir` flag.

To reproduce:

1. Clone this repo
2. Setup a local postgres database called `goose`
3. Run `goose postgres "postgresql://localhost:5432/goose?sslmode=disable" up -dir migrations`.

   This will yield:
   ```
   ╭─br0d@archvard ~/…/github.com/m0ar/goose-dir-bug ‹master*›
   ╰─➤  goose postgres "postgresql://localhost:5432/goose?sslmode=disable" up -dir migrations
   2019/03/05 11:47:47 goose: no migrations to run. current version: 0
   ```
4. Run `cd migrations && goose postgres "postgresql://localhost:5432/goose?sslmode=disable" up -dir .`

   This will successfully apply the migrations to the DB:
   ```
   ╭─br0d@archvard ~/…/github.com/m0ar/goose-dir-bug ‹master*›
   ╰─➤  cd migrations && goose postgres "postgresql://localhost:5432/goose?sslmode=disable" up -dir .
   2019/03/05 11:51:10 OK    20190305113955_derp.sql
   2019/03/05 11:51:10 goose: no migrations to run. current version: 20190305113955

   ```
