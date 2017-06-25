# Acercar Ingeniería

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/sasalatart/acercar-ingenieria)
[![](https://images.microbadger.com/badges/version/sasalatart/acercar-ingenieria.svg)](https://microbadger.com/images/sasalatart/acercar-ingenieria)
[![](https://images.microbadger.com/badges/image/sasalatart/acercar-ingenieria.svg)](https://microbadger.com/images/sasalatart/acercar-ingenieria)
[![Code Climate](https://codeclimate.com/github/sasalatart/acercar-ingenieria/badges/gpa.svg)](https://codeclimate.com/github/sasalatart/acercar-ingenieria)

> 2014-2015

> Tomás Günther [(<tpgunther@uc.cl>)](mailto:tpgunther@uc.cl)

> Fernando Martínez [(<femartinez@uc.cl>)](mailto:femartinez@uc.cl)

> Sebastián Salata [(<sasalata@uc.cl>)](mailto:sasalata@uc.cl)

## About

Proyecto del [Centro de Alumnos de Ingeniería UC 2014](http://www.cai.cl).

Espacio de encuentro para que los nuevos alumnos de ingeniería encuentren sus motivaciones e información acerca de la malla a seguir.

## Setup

Environment Variables:

 * **SECRET_KEY_BASE**: *used for verifying the integrity of signed cookies*
 * **HOST**: *the app host (localhost is assumed if not set)*
 * **MAILGUN_API_KEY**: *your Mailgun API key*
 * **MAILGUN_DOMAIN**: *your Mailgun domain*
 * **CLOUDINARY_CLOUD_NAME**: *your Cloudinary cloud name*
 * **CLOUDINARY_API_KEY**: *your Cloudinary API key*
 * **CLOUDINARY_API_SECRET**: *your Cloudinary API secret*

### Development

1. Clone and cd into this repository
2. Run `bundle install`
3. Set each of the Environment Variables by doing either of the following:
  * Run `export VARIABLE_NAME=value` in the shell for a temporary setup.
  * Write `export VARIABLE_NAME=value` in the shell's configuration file for its persistance (remember to reload the shell after doing so).
4. Setup the database:
  * Run `bundle exec rake db:reset` for a minimum setup.
  * Run `bundle exec rake db:reset FAKE_DATA=true` for a setup with additional users, comments, reviews, etc.
5. Run `rails s`

### Docker

First, make sure to have a file called `.env.list` with the environment variables in the form of KEY=VALUE. Then, proceed with the following commands:

```sh
# Run the database
$ docker run -d --name=postgres_db postgres:9.6.1

# Run the application
$ docker run -d --name=acercaringenieria -p 80:3000 --env-file ./.env.list \
             --link=postgres_db:postgres_db sasalatart/acercar-ingenieria

# Setup the database
$ docker exec acercaringenieria bundle exec rake db:reset
```

The server's machine should now be redirecting its port 80 to the container's port 3000.
