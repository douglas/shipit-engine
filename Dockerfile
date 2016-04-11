FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /shipit
WORKDIR /shipit
ADD Gemfile /shipit/Gemfile
ADD Gemfile.lock /shipit/Gemfile.lock
RUN bundle install
ADD . /shipit
