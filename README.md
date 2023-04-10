# canihost

An experiment in self-hosting containerised Phoenix applications. Each application needs the following:

1. A `Dockerfile`, which takes care of building the application image.
2. A `docker-compose.yml` file, which defines the application services, volumes, and so forth.
3. A `bin` directory, containing a few helper scripts.

## `Dockerfile`
The `Dockerfile` is the default file generated by `mix phx.gen.release --docker`.

## `docker-compose.yml`
The `docker-compose.yml` file contains a few important elements.

- The `name` cannot be the same as another project running on the same server.
- The `app` service must specify the following environment variables:
  - `LETSENCRYPT_HOST` is used by [the `nginxproxy/acme-companion` container](https://github.com/nginx-proxy/acme-companion) to automatically set up and renew SSL certificates.
  - `VIRTUAL_HOST` and `VIRTUAL_PORT` are used by [the `nginxproxy/nginx-proxy` container](https://github.com/nginx-proxy/nginx-proxy) to automatically configure the Nginx reverse proxy. Note that you _do not_ need to specify a different `VIRTUAL_PORT` for each project.
- The `network_mode` must be set to `bridge`.

## The `bin` directory
Once you've got everything up and running, deploying a new version is usually just a case of running `bash bin/update.sh` from the project root directory.
