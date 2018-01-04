FROM nginx:latest

#Update and install extras
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y curl

#Prepare directory structures and users
RUN rm -fr /etc/nginx/sites-available/* && rm -fr /etc/nginx/sites-enabled/*
#Create th root of the site
RUN mkdir -p /www/site
#remove any default templates
RUN rm -fr /etc/nginx/conf.d/*
RUN mkdir -p /etc/nginx/conf.d

RUN useradd www
RUN chown -R www:www /www/site
RUN chmod 755 /www

#Copy files
COPY ./etc/nginx.conf /etc/
COPY ./etc/default.conf /etc/nginx/conf.d/
COPY ./ /www/site

#Check for syntax errors in nginx files and run the server  on port 80
RUN nginx -t
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
