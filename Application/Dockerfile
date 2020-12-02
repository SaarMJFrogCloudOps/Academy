FROM nginx:latest

COPY index.html /usr/share/nginx/html
COPY arc.png /usr/share/nginx/html
COPY tls.conf /etc/nginx/conf.d/
EXPOSE 80 443 	

CMD ["nginx", "-g", "daemon off;"]