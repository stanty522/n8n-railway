FROM node:18-alpine

ARG N8N_VERSION=1.94.1

# Add required dependencies
RUN apk add --update graphicsmagick tzdata python3 build-base

# Install n8n globally with version
RUN npm_config_user=root npm install --location=global n8n@${N8N_VERSION}

# Set working directory
WORKDIR /data

# Set default environment variables
ENV N8N_USER_ID=root
ENV N8N_PORT=5678

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
