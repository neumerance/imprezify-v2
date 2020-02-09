FROM ruby:2.6.0-alpine

ARG RAILS_ENV=production

ENV BUNDLE_REPO__FURY__IO ${GEMFURY_KEY}
ENV RAILS_ENV ${RAILS_ENV}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

WORKDIR ~/app

# Dependencies for nokogiri and pg
RUN apk add --update \
        build-base \
        libxml2-dev \
        libxslt-dev \
        postgresql-dev \
        nodejs>8 \
		git \
    && rm -rf /var/cache/apk/*

ADD Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --without development test doc guard

ADD . .

## Compile assets
## .deploy.env only exists inside DroneCI
RUN  bundle exec rake assets:precompile

CMD ./docker-entrypoint.sh
