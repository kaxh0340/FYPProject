# Use an official Nginx image as the base image
FROM nginx:latest

# Set the working directory in the container
WORKDIR /usr/share/nginx/html

# Copy the website files into the container
COPY index.html .
COPY assets/ assets/
COPY vendor/ vendor/

# Expose port 80 to the outside world
EXPOSE 80
