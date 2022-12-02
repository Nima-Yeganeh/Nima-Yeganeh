FROM python:2.7

ENV PYTHONUNBUFFERED=1 \
    PIP_REQUIRE_VIRTUALENV=false \
    TERM=xterm

# utilities incl. envplate (env-var templating)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
        netcat nano && \
    apt-get clean && rm -r /var/lib/apt/lists/* && \
    curl -sSLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && \
    chmod +x /usr/local/bin/ep

# install uWSGI, PostgreSQL adapter & djangocms-installer
RUN pip install uwsgi \
                psycopg2==2.6.1 \
                djangocms-installer && \
	mkdir -v /uwsgi/ && \
    chown -Rv www-data:www-data /uwsgi

COPY ./nginx/conf.d/ /etc/nginx/conf.d/
COPY ./config/ /config/
COPY ./scripts/ /usr/local/bin/

VOLUME [ "/cms", "/config", "/uwsgi", "/etc/nginx/conf.d"]

EXPOSE 8000
WORKDIR /cms

# Install django-CMS site on first-run of container
ENTRYPOINT ["docker-entrypoint"]

CMD ["uwsgi", "--ini", "/config/uwsgi.ini"]
