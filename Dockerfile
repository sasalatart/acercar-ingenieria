FROM ruby:2.3-onbuild

MAINTAINER Sebastian Salata R-T <SA.SalataRT@GMail.com>

ENV RAILS_ENV production

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs imagemagick && \
    apt-get clean && \
    bundle exec rake assets:precompile

EXPOSE 3000
