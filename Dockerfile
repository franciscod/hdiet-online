FROM ubuntu:precise

RUN apt-get update && apt-get install -y \
    apache2 \
    build-essential \
    cpanminus \
    libcrypt-cbc-perl \
    libdigest-perl \
    libgd-graph-perl \
    libssl-dev \
    libxml2-dev \
    libxml-libxml-perl \
    weblint-perl

RUN mkdir -p /var/lib/hackdiet/Users /var/lib/hackdiet/Sessions
RUN chown -R www-data:www-data /var/lib/hackdiet

COPY src/ /app

WORKDIR /app
RUN make publish

RUN cd /etc/apache2/mods-enabled/; ln -s ../mods-available/cgi.load

CMD /usr/sbin/apache2ctl -D FOREGROUND
