ARG NODE_VERSION=20-bookworm-slim

# Use Node image
FROM node:${NODE_VERSION}

# Set the working directory inside the container
WORKDIR /app

# Install Git
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clone the project
RUN git clone https://github.com/Pianissimo7/octopussimo-music-bot.git .

# Install necessary dependencies only
RUN npm ci --omit=dev --omit=optional

# Install extre dependencies
RUN npm install mediaplex
RUN apt-get install -y --no-install-recommends ffmpeg

# Register the bot's commands
RUN npm register

# Command to run the application
CMD ["npm", "start"]
