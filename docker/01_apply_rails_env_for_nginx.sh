#!/bin/bash
sed s/%RAILS_ENV%/$RAILS_ENV/g /etc/nginx/app.conf.template > /etc/nginx/sites-enabled/app.conf
