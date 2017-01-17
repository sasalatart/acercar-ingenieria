FROM ruby:2.3-onbuild

MAINTAINER Sebastian Salata R-T <SA.SalataRT@GMail.com>

ENV RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true RAILS_LOG_TO_STDOUT=true

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs imagemagick && \
    apt-get clean && \
    bundle exec rake assets:precompile

EXPOSE 3000

CMD ["rails", "server", "puma", "-b", "0.0.0.0"]
