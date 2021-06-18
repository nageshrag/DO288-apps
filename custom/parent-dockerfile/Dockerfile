FROM quay.io/centos/centos:centos7
RUN yum install -y epel-release && \
          yum install -y nginx
USER root
COPY index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

ONBUILD COPY index.html /usr/share/nginx/html


# forward request and error logs to docker log collector
# RUN ln -sf /dev/stdout /var/log/nginx/access.log \
#	&& ln -sf /dev/stderr /var/log/nginx/error.log


CMD /usr/sbin/nginx -g 'daemon off;'
