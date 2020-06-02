TiDB
====

Dockerfile
----------

```
FROM debian:latest
RUN apt update && apt full-upgrade
RUN apt install -y curl default-mysql-client
RUN curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh
EXPOSE 4000:4000 2379:2379
ENV PATH=$PATH:/root/.tiup/bin/
RUN tiup install playground
RUN tiup install tikv
RUN tiup install tidb
RUN tiup install pd
RUN tiup install tiflash
ENTRYPOINT ["tiup", "playground", "--db.host", "0.0.0.0", "--pd.host", "0.0.0.0"]
```

Commands
--------

```
docker volume create tidb
docker build -t tidb .
docker run -it --rm -p 4000:4000 -p 2379:2379 -v tidb:/data tidb
```
