FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
ARG PROJECT_NAME=marketplace_barebones
RUN mkdir /$PROJECT_NAME
WORKDIR /$PROJECT_NAME
COPY Gemfile /$PROJECT_NAME/Gemfile
COPY Gemfile.lock /$PROJECT_NAME/Gemfile.lock
RUN bundle install
COPY . /$PROJECT_NAME