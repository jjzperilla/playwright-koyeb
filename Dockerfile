# Use a lightweight Node.js image
FROM mcr.microsoft.com/playwright:focal

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the required port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
