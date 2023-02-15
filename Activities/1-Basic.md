# Activity 1: Basic

Run and interact with a rather plain docker-in-docker service.

## Starting

```
docker compose up -d docker
```

## Connect to the Container
### Docker Compose Exec

To get a shell directly in the docker-in-docker container:

```sh
docker compose exec docker sh
```

Once there, you can use the Docker CLI as usual.
