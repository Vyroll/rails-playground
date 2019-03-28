FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y sqlite3
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs
RUN mkdir /playground
WORKDIR /playground
ADD Gemfile /playground/Gemfile
ADD Gemfile.lock /playground/Gemfile.lock
RUN bundle install
ADD . /playground