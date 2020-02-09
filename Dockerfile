FROM ruby:2.6.0-slim

ARG RAILS_ENV=production

ENV RAILS_ENV ${RAILS_ENV}

WORKDIR /app

RUN apt update && \
    apt install -y --no-install-recommends \
          curl \
          git \
          gnupg2 \
          build-essential \
          libpq-dev \
          imagemagick

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs
RUN npm install -g yarn

## Install gem
RUN gem install bundler
ADD Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --without development test doc guard

ADD . .

## Compile assets
RUN	bundle exec rake assets:precompile

## Remove cache
RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    yarn cache clean && \
    rm -rf /usr/local/bundle/cache ~/.bundle/cache && \
    rm -rf tmp/cache/*

CMD ./docker-entrypoint.sh
