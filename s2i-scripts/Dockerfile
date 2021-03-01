FROM registry.redhat.io/rhscl/httpd-24-rhel7

# Generic labels
LABEL Component="httpd" \
      Name="s2i-do288-httpd" \
      Version="1.0" \
      Release="1"
# Labels consumed by OpenShift
LABEL io.k8s.description="A basic Apache HTTP Server S2I builder image" \
      io.k8s.display-name="Apache HTTP Server S2I builder image for DO288" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"
# This label is used to categorize this image as a builder image in the
# OpenShift web console.
LABEL io.openshift.tags="builder, httpd, httpd24"
# Apache HTTP Server DocRoot
ENV DOCROOT /var/www/html
RUN   yum install -y --nodocs --disableplugin=subscription-manager httpd && \
      yum clean all --disableplugin=subscription-manager -y && \
      echo "This is the default index page from the s2i-do288-httpd S2I builder image." > ${DOCROOT}/index.html
# Change web server port to 8080
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf
# Copy the S2I scripts to the default location indicated by the
COPY ./s2i/bin/ /usr/libexec/s2i

# Let the assemble script install the dependencies
RUN /usr/libexec/s2i/assemble

# The run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
