FROM rails:4.2

RUN apt-get update -qq && apt-get install -y build-essential locales

# Use en_US.UTF-8 as our locale
RUN locale-gen en_US.UTF-8 
ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8

ENV APP_HOME /shipit
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile $APP_HOME/
ADD Gemfile.lock $APP_HOME/
ADD . $APP_HOME

RUN bundle install
EXPOSE 3000
CMD ["rails", "server"]
