FROM quay.io/nagesh_rag25/custom-nginx:latest
RUN sed -i "s/listen       80 default_server;/listen       8081 default_server;/g" /etc/nginx/nginx.conf 
EXPOSE 8081
RUN echo 'abc' > /dev/stdout


