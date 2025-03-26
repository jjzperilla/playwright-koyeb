# Use Playwright's official image (includes dependencies)
FROM mcr.microsoft.com/playwright:v1.42.0-focal

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Playwright browsers
RUN npx playwright install --with-deps

# Copy the rest of the application code
COPY . .

# Expose the port if using Express
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
