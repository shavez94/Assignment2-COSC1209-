# Use an official Node.js runtime as a base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# Expose the application port (3000 as per compose.yaml)
EXPOSE 3000

# Command to run the app
CMD ["node", "index.js"]
