# Exercise 1: Basic

This is a simple Docker Compose file with Docker-in-Docker, and TLS certificates.

## Starting

```
docker compose up -d docker
```

## Connecting from the Host

The compose file exposes the Docker API port with TLS enabled on port 3376.

The Docker CLI supports the use of "contexts", to configure save connection
profiles.

To configure a context for the docker-in-docker server on the host
machine:

```sh
docker context create dind --description "Docker in Docker" --docker "host=tcp://localhost:3376,ca=$(pwd)/certs/client/ca.pem,cert=$(pwd)/certs/client/cert.pem,key=$(pwd)/certs/client/key.pem"
```

To use the new profile:

```sh
docker context use dind
```

Too switch back to the default:

```sh
docker context use default
```
