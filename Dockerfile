FROM ruby:3.0.0 AS rails-toolbox
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH
RUN gem install rails 
WORKDIR /opt/app
CMD ["/bin/sh"]
