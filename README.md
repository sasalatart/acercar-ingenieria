# Acercar Ingeniería

[![](https://images.microbadger.com/badges/version/sasalatart/acercar-ingenieria.svg)](https://microbadger.com/images/sasalatart/acercar-ingenieria "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/sasalatart/acercar-ingenieria.svg)](https://microbadger.com/images/sasalatart/acercar-ingenieria "Get your own image badge on microbadger.com")
[![Code Climate](https://codeclimate.com/github/sasalatart/acercar-ingenieria/badges/gpa.svg)](https://codeclimate.com/github/sasalatart/acercar-ingenieria)

> 2014-2015

> Tomás Günther [(<tpgunther@uc.cl>)](mailto:tpgunther@uc.cl)

> Fernando Martínez [(<femartinez@uc.cl>)](mailto:femartinez@uc.cl)

> Sebastián Salata [(<sasalata@uc.cl>)](mailto:sasalata@uc.cl)

## About

*Proyecto del [Centro de Alumnos de Ingeniería UC 2014](http://www.cai.cl).*

*Espacio de encuentro para que los nuevos alumnos de ingeniería encuentren sus motivaciones e información acerca de la malla a seguir.*

## Setup

Environment Variables:

 * **SECRET_KEY_BASE**: *used for verifying the integrity of signed cookies*
 * **AI_EMAIL_USERNAME**: *the GMail powered user mail*
 * **AI_EMAIL_PASSWORD**: *the GMail powered user mail's password*
 * **AI_HOST**: *the app host*
 * **AI_PORT**: *the app port*

##### Development

1. Clone and cd into this repository
2. Run `bundle install`
3. Set each of the Environment Variables:
  * Run `export VARIABLE_NAME=value` in the shell for a temporary setup.
  * Write `export VARIABLE_NAME=value` in the shell's configuration file for its persistance (remember to reload the shell after doing so).
4. Run `bundle exec rake db:reset`
5. Run `rails s`

##### Docker

```sh
# Set the required environment variables
$ export SECRET_KEY_BASE=anystring
$ export AI_EMAIL_USERNAME="your-application's-email"
$ export AI_EMAIL_PASSWORD="your-application's-email-password"
$ export AI_HOST="your-application's-host"
$ export AI_PORT="your-application's-port"

# Build
$ docker-compose build

# Run
$ docker-compose up -d

# Setup the database
$ docker-compose run web bundle exec rake db:reset
```

The server's machine should now be redirecting its port 80 to the container's port 3000.

To stop:
```sh
$ docker-compose stop
```
