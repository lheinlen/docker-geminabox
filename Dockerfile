FROM ruby:2.3.1
MAINTAINER	Lucas Heinlen <lucas.heinlen@gmail.com>, Quiqup <dev@quiqup.com>

RUN mkdir -p /opt/geminabox/
WORKDIR /opt/geminabox
VOLUME '/opt/geminabox/data'

ADD files/* ./
RUN gem install bundler unicorn
RUN bundle config --global path /usr/local/bundle
RUN bundle install --binstubs --retry 5 --jobs 5

EXPOSE	80
WORKDIR /opt/geminabox
#CMD 'unicorn -c unicorn.rb -p 80'
CMD 'rackup'