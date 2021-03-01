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
# Add application sources to a directory where the assemble script expects them
# and set permissions so that the container runs without the root access
USER 0
RUN chown -R 1001:0 /tmp/src
USER 1001

# Let the assemble script install the dependencies
RUN /usr/libexec/s2i/assemble

# The run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
