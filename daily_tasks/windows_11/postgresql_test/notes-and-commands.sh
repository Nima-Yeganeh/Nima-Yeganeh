docker build -t eg_postgresql .
docker run -d --rm -P --name pg_test eg_postgresql
docker run --rm -t -i --link pg_test:pg eg_postgresql bash
psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password
docker ps
psql -h localhost -p 49153 -d docker -U docker --password
docker run --rm --volumes-from pg_test -t -i busybox sh
ls /etc/postgresql/14/main/
ls /var/log
