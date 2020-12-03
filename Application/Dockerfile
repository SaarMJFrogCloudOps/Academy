FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
COPY arc.png /usr/share/nginx/html/arc.png
COPY tls/tls.conf /etc/nginx/conf.d/tls.conf
COPY tls/test-tls.key /etc/nginx/certs/test-tls.key
COPY tls/test-tls.crt /etc/nginx/certs/test-tls.crt
EXPOSE 80 443 	

CMD ["nginx", "-g", "daemon off;"]