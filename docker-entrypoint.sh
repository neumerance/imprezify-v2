#!/bin/sh

rails_env=${RAILS_ENV:-staging}

RAILS_ENV=${rails_env} `which rake` db:create
RAILS_ENV=${rails_env} `which rake` db:migrate
RAILS_ENV=${rails_env} `which puma` -C config/puma.rb
