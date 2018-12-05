FROM ruby:2.4.4

ARG RAILS_ENV
ARG BUNDLE_WITHOUT

ENV RAILS_ENV ${RAILS_ENV}
ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && rm -rf /var/lib/apt/lists/*

RUN mkdir /honestbee_interview_test
WORKDIR /honestbee_interview_test

COPY Gemfile* /honestbee_interview_test/

RUN bundle config --global frozen 1 \
 && bundle install -j4 --retry 3 \
 # Remove unneeded files (cached *.gem, *.o, *.c)
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

ADD . /honestbee_interview_test

# build assets
RUN bundle exec rake assets:precompile

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]
