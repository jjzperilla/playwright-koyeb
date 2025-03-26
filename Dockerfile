# Use Playwright’s official base image (includes dependencies)
FROM mcr.microsoft.com/playwright:focal

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies, including Playwright browsers
RUN npm install && npx playwright install --with-deps

# Copy all source code
COPY . .

# Expose the application port (if needed)
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
