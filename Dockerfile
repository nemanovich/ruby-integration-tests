FROM ruby:2.7.2-alpine3.13

# Установка в контейнер runtime-зависимостей приложения
#RUN apk add --update --virtual runtime-depsnodejs libffi-dev readline sqlite

# Соберем все во временной директории
WORKDIR /tmp
COPY Gemfile* ./

ENV BUNDLER_VERSION=2.2.8

RUN apk add --virtual build-deps build-base libc-dev linux-headers libxml2-dev libxslt-dev readline-dev && \
    bundle install --jobs=2 && \
    apk del build-deps

# Копирование кода приложения в контейнер
ENV APP_HOME /app
COPY . $APP_HOME
WORKDIR $APP_HOME

CMD ["bundle", "exec", "cucumber", "features", "--publish"]