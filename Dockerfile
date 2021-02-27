FROM yandex/clickhouse-client
COPY backup.sh .
ENV CLICKHOUSE_HOST=clickhouse
ENV TABLE=default_local
VOLUME /backup
CMD ["./backup.sh"]
