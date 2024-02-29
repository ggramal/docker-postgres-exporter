# Postgres exporter image
This image overrides the default image [postgres-exporter](https://github.com/prometheus-community/postgres_exporter#quick-start) and adds support for setting postgres exporter arguments (that do not support it) via environment variables

## Running
All collector arguments can be set via env variables adding `PG_EXPORTER_COLLECTOR_` prefix. For example

```
--collector.database ( PG_EXPORTER_COLLECTOR_DATABASE=true)
--no-collector.database ( PG_EXPORTER_COLLECTOR_DATABASE=false)
--collector.replication_slot (PG_EXPORTER_COLLECTOR_REPLICATION_SLOT=true)
--no-collector.replication_slot (PG_EXPORTER_COLLECTOR_REPLICATION_SLOT=false)

```

Plus you can set `--web.listen-address` using `PG_EXPORTER_WEB_LISTEN_ADDRESS=9111`

docker example

```
docker run --rm -e PG_EXPORTER_COLLECTOR_REPLICATION_SLOT=true -e PG_EXPORTER_WEB_LISTEN_ADDRESS=9111 gramal/postgres-exporter:latest
```

## Why this is needed?

We use postgres-operator from zalando and currently [it does not support adding arguments to configured sidecars](https://github.com/zalando/postgres-operator/issues/2448). So in order to add different cmd line options to postgres-exporter we use this image that enables setting cmd line args through env vars
