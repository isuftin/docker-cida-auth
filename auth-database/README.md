# Auth Database

This container provides the PostgreSQL database to serve the CIDA Auth application.  It is easiest to run this container using Docker Compose with the compose configuration file found in the [GitHub repository](https://github.com/USGS-CIDA/docker-cida-auth) for this image.

## Docker Instructions

This application is set up to use Docker and Docker Compose to create a local development environment. Check out the project from the project's [GitHub repository](https://github.com/USGS-CIDA/docker-cida-auth) and run Docker Compose. Running `docker-compose up auth-database` should be enough to pull down the Docker image and spin up the database service.

### Environments

The file compose.env is a [Docker Compose environment file](https://docs.docker.com/compose/compose-file/#env-file) and includes the variable values that some of the service require. For local development, feel free to alter this file to your liking. However, if you wish to leave this file be and create a secondary environemnt file, I suggest creating `compose_local.env` because that's already included in .gitignore. In order to use your local file, you should export an environment variable named `AUTH_ENV_LOCAL`:

```
$ export AUTH_ENV_LOCAL=".local"
```
