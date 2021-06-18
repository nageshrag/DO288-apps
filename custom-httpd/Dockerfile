FROM quay.io/nagesh_rag25/custom-httpd:latest
EXPOSE 8080
LABEL io.openshift.expose-services="8080:http"
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
RUN chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd
