# Use Playwright's official Docker image, which includes all dependencies
FROM mcr.microsoft.com/playwright:focal

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first (to optimize caching)
COPY package*.json ./

# Install dependencies, including Playwright browsers
RUN npm install \
    && npx playwright install --with-deps

# Copy the rest of the application files
COPY . .

# Expose the required port (adjust based on your app)
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
