FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs sqlite3
RUN mkdir /playground
WORKDIR /playground
ADD Gemfile /playground/Gemfile
ADD Gemfile.lock /playground/Gemfile.lock
RUN bundle install
ADD . /playground