# Use Node.js slim image as the base for building the static site
FROM node:23.1.0-slim AS builder

# Set working directory
WORKDIR /app

# Only copy package files to leverage Docker cache if dependencies haven't changed
COPY package.json package-lock.json .npmrc ./

# Install dependencies
RUN npm ci && npm cache clean --force

# Copy the rest of the application files except those specified in .dockerignore
COPY . .

# Build the Next.js application for static export
RUN npm run build

# ------------------------------
# Stage 2: Prepare Nginx to serve the static files
# ------------------------------
FROM nginx:1.27.2-alpine AS runner

# Copy static build output from builder to Nginx's default HTML directory
COPY --from=builder /app/out /usr/share/nginx/html


# Expose port 80 for serving the static files
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]