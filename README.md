# Lab: Docker-in-Docker

Experimenting with Docker configuration, using Docker-in-Docker for some minor
isolation from other Docker workloads on the machine.

# Why?
When developing software that interacts with the Docker API, sometimes it's
helpful to have a Docker instance isolated from the environment you're using for
your dev containeers, or other projects.

# Exercises

1. [Basic](./Activities/1-Basic.md)


## References
### Docker in Docker
- [Docker in Docker Image](https://hub.docker.com/_/docker)
- [Compose File Reference](https://docs.docker.com/compose/compose-file/)
- [Docker CLI Reference](https://docs.docker.com/engine/reference/commandline/cli/#environment-variables)

### Development Environment
- [Visual Studio Code](https://code.visualstudio.com/)
- [Developing Inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
- [Devcontainers JSON Reference](https://containers.dev/implementors/json_reference/)
- [Ubuntu Base Devcontainer](https://github.com/devcontainers/images/tree/main/src/base-ubuntu)
- [Docker on Host Feature](https://github.com/devcontainers/features/tree/main/src/docker-outside-of-docker)
