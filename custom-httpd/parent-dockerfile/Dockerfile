FROM quay.io/centos/centos:centos7
  

#MAINTAINER Red Hat Training <training@redhat.com>

# Generic labels

LABEL Component="httpd" \
      Name="do288/httpd-parent" \
      Version="1.0" \
      Release="1"

# Labels consumed by OpenShift
LABEL io.k8s.description="A basic Apache HTTP Server image with ONBUILD instructions" \
      io.k8s.display-name="Apache HTTP Server parent image" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="apache, httpd"


# DocumentRoot for Apache
ENV DOCROOT=/var/www/html \
    LANG=en_US \
    LOG_PATH=/var/log/httpd


# Need this for installing Apache from classroom yum repo

#ADD training.repo /etc/yum.repos.d/training.repo

RUN yum install -y --setopt=tsflags=nodocs --noplugins httpd && \
    yum clean all --noplugins -y && \
    echo "Hello from the httpd-parent container!" > ${HOME}/index.html

# Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ ${DOCROOT}/
EXPOSE 80

# This stuff is needed to ensure a clean start

RUN rm -rf /run/httpd && mkdir /run/httpd
# Run as the root user

USER root

# Launch apache daemon
CMD /usr/sbin/apachectl -DFOREGROUND
