FROM ruby:2.6.0-alpine

ARG RAILS_ENV=production

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
        nodejs \
		git \
    && rm -rf /var/cache/apk/*

ADD Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --without development test doc guard

RUN npm install -g yarn

ADD . .

## Compile assets
RUN  bundle exec rake assets:precompile

CMD ./docker-entrypoint.sh
