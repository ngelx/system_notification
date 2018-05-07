FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs advancecomp jhead locales default-jre

RUN mkdir /myapp
WORKDIR /myapp

ENV BUNDLE_PATH /myapp/.bundle

# Set the locale
RUN locale-gen C.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

## We need this as is the base mont point
ADD . /myapp
