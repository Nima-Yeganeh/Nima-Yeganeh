# Docker Vue-cli 3
> Docker-compose for @vue/cli (NODE - VUE3)

Build container

```sh
$ docker-compose build
```

Create and run new `vue/cli` webpack proyect

```sh
$ docker-compose up
or
$ docker-compose run --rm --service-ports vue
```

Or copy your vue in `web/` and run

```sh
$ docker-compose up
or
$ docker-compose run --rm --service-ports vue
```

Access project

```sh
http://localhost:8080
```
