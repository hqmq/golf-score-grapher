FROM phusion/passenger-ruby21:0.9.11
MAINTAINER Michael Ries <michael@riesd.com>

# Dev Mode
#VOLUME /home/app/golf

# Prod Mode
ADD . /home/app/golf
VOLUME /home/app/db

# Setup Nginx
ADD config/nginx.site.conf /etc/nginx/sites-enabled/golf.conf
RUN rm -f /etc/nginx/sites-enabled/default && rm -f /etc/service/nginx/down && apt-get update && apt-get install libsqlite3-dev && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*~

WORKDIR /home/app/golf
RUN bundle install && bundle exec rake assets:precompile

CMD /sbin/my_init
