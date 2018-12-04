#!/bin/sh
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# If database exists, migrate. Otherweise create and seed
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup db:seed

exec bundle exec "$@"
