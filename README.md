# canihost

An experiment in self-hosting containerised Phoenix applications. Each application needs the following:

1. A `Dockerfile`, which takes care of building the application image.
2. A `docker-compose.yml` file, which defines the application services, volumes, and so forth.

## `Dockerfile`
The `Dockerfile` is the default file generated by `mix phx.gen.release --docker`.

## `docker-compose.yml`
The `docker-compose.yml` file contains a few important elements.

- The `name` cannot be the same as another project running on the same server.
- The `app` service must specify the following environment variables:
  - `LETSENCRYPT_HOST` is used by [the `nginxproxy/acme-companion` container](https://github.com/nginx-proxy/acme-companion) to automatically set up and renew SSL certificates.
  - `VIRTUAL_HOST` and `VIRTUAL_PORT` are used by [the `nginxproxy/nginx-proxy` container](https://github.com/nginx-proxy/nginx-proxy) to automatically configure the Nginx reverse proxy. Note that you _do not_ need to specify a different `VIRTUAL_PORT` for each project.
- The `app` service must include `flyby` in its `networks` list. Otherwise the reverse proxy won't work.

The `docker-compose.yml` file also expects two environment variable files.

- `app.env` defines the environment variables required by the `app` container, such as the `SECRET_BASE_KEY`.
- `db.env` defines the environment variables required the `db` container, such as the `POSTGRES_PASSWORD`.
