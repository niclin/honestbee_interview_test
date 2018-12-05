FROM ruby:2.4.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /honestbee_interview_test
WORKDIR /honestbee_interview_test

COPY Gemfile /honestbee_interview_test/Gemfile
COPY Gemfile.lock /honestbee_interview_test/Gemfile.lock

RUN bundle install
ADD . /honestbee_interview_test

# build assets
RUN bundle exec rake assets:precompile

ENV RAILS_ENV=production

COPY docker-entrypoint.sh /usr/local/bin

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh /

ENTRYPOINT ["docker-entrypoint.sh"]
