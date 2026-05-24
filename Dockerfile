# Use lightweight Nginx image
FROM nginx:alpine

# Copy your static files into Nginx's default folder
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Nginx listens on port 80 inside the container
EXPOSE 80
