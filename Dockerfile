FROM phusion/passenger-ruby21:0.9.14
MAINTAINER Michael Ries <michael@riesd.com>

# Setup Nginx
ADD config/nginx.site.conf /etc/nginx/sites-enabled/golf.conf
RUN rm -f /etc/nginx/sites-enabled/default && rm -f /etc/service/nginx/down && apt-get update && apt-get install libsqlite3-dev && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*~

# Prod Mode
ADD . /home/app/golf
RUN chown app:app -R /home/app
VOLUME /home/app/db

WORKDIR /home/app/golf
USER root
RUN bundle install && bundle exec rake assets:precompile

CMD /sbin/my_init
