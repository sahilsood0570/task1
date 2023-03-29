FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt install nginx php-fpm php-mysql wget unzip -y
COPY script.sh .                                                   
RUN wget https://wordpress.org/latest.zip -P /var/www/html/
RUN unzip /var/www/html/latest.zip -d /var/www/html/
RUN rm -rf /etc/nginx/sites-enabled/default
COPY default /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
RUN chmod +x script.sh
EXPOSE 80
ENTRYPOINT ./script.sh  

