FROM ruby:3.0.2-alpine

# application folder
ENV APP_HOME=/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# required libs
RUN apk add --no-cache --update-cache bash build-base git postgresql-dev tzdata

# change timezone
ENV TZ=America/Sao_Paulo

# install application gems
ARG EXCLUDE_GEMS="test"

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle config set specific_platform true
RUN bundle config set without $EXCLUDE_GEMS
RUN bundle install

# copy application source code
COPY . .

# starts the server
CMD [ "rails", "server", "--binding", "0.0.0.0" ]
