# Use Node.js base image
FROM node:18-bullseye

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Install Playwright & browsers
RUN npx playwright install --with-deps

# Copy the rest of the application code
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
