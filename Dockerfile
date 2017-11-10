FROM ruby:2.4.1

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

RUN cat /dev/null > "$APP_HOME/log/development.log"
RUN chmod -R a+w "$APP_HOME/log"

RUN mkdir -p /usr/src/app/tmp/cache \
    && mkdir -p /usr/src/app/tmp/pids \
    && mkdir -p /usr/src/app/tmp/sockets \
    && rails assets:precompile \
    && chown -R nobody /usr/src/app

USER nobody

RUN echo $PATH
EXPOSE 3000

