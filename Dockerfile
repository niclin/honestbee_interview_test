FROM ruby:2.4.4

ARG RAILS_ENV

ENV RAILS_ENV ${RAILS_ENV}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /honestbee_interview_test
WORKDIR /honestbee_interview_test

COPY Gemfile /honestbee_interview_test/Gemfile
COPY Gemfile.lock /honestbee_interview_test/Gemfile.lock

RUN bundle install --without development test
ADD . /honestbee_interview_test

# build assets
RUN bundle exec rake assets:precompile

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]
