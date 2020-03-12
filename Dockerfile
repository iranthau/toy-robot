FROM ruby:2.7.0-alpine

RUN apk add --update-cache \
    bash \
    build-base \
  && rm -rf /var/cache/apk/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bash", "-c", "bin/toy_robot"]