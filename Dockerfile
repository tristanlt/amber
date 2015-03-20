FROM phusion/passenger-ruby21
RUN mkdir -p /home/app
WORKDIR /home/app
RUN rm -f /etc/service/nginx/down
ENV RAILS_ENV development
ADD Gemfile /home/app/
ADD Gemfile.lock /home/app/
RUN bundle config --global frozen 1
RUN bundle install
COPY . /home/app
RUN chown -R app.app  /home/app
RUN rm -f /etc/nginx/sites-enabled/default
ADD docker/app.conf.template /etc/nginx/
ADD docker/01_apply_rails_env_for_nginx.sh /etc/my_init.d/
RUN chmod +x /etc/my_init.d/01_apply_rails_env_for_nginx.sh
ADD docker/underscoreheaderson.conf /etc/nginx/conf.d/
ADD docker/preserve-env.conf /etc/nginx/main.d/
EXPOSE 80
