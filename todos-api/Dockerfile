# Use the official Node.js image with the specified version
FROM node:8.17.0

# Set the working directory inside the container
WORKDIR /app

COPY package.json .
RUN npm install

# Copy the rest of the application source code
COPY . .

# Expose the port the application runs on
EXPOSE 8082

# Command to run the application
CMD ["npm", "start"]