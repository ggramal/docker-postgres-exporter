FROM quay.io/prometheuscommunity/postgres-exporter:v0.15.0
COPY docker-entrypoint.sh /
ENTRYPOINT /docker-entrypoint.sh
