#!/bin/sh

rails_env=${RAILS_ENV:-staging}

RAILS_ENV=${rails_env} rake db:create
RAILS_ENV=${rails_env} rake db:migrate
RAILS_ENV=${rails_env} puma -C config/puma.rb
