FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
COPY arc.png /usr/share/nginx/html/arc.png
COPY tls/tls.conf /etc/nginx/conf.d/tls.conf

EXPOSE 80 443 	

CMD ["nginx", "-g", "daemon off;"]