FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y locales && localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8
RUN apt-get install -y apache2 python-dev 
RUN apt-get install -y python-pyproj python-pil python-pip libapache2-mod-wsgi
RUN apt-get install -y libjpeg-dev zlib1g-dev libyaml-dev

RUN a2enmod wsgi
RUN pip install MapProxy

ADD setup /usr/local/bin/setup
ADD run /usr/local/bin/run

EXPOSE 80
CMD ["/usr/local/bin/run"]

