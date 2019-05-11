FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential
WORKDIR /code

#TODO better bundling based on https://medium.com/@jfroom/docker-compose-3-bundler-caching-in-dev-9ca1e49ac441

COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install
CMD bundle exec rails s -b 0.0.0.0
