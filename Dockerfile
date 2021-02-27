FROM yandex/clickhouse-client
COPY backup.sh .
ENV CLICKHOUSE_HOST=clickhouse
ENV TABLE=default_local
VOLUME /backup
ENTRYPOINT [ "/bin/sh" ]
CMD ["./backup.sh"]
