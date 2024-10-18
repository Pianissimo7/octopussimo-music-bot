ARG NODE_VERSION=18-buster

# Use Node image
FROM --platform=linux/amd64 node:${NODE_VERSION}

# Set the working directory inside the container
WORKDIR /app

# Install necessary packages for mediaplex and ffmpeg
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Clone the project
RUN git clone https://github.com/Pianissimo7/octopussimo-music-bot.git .

# Install extre dependencies
RUN npm install
RUN npm install mediaplex
RUN apt-get install -y --no-install-recommends ffmpeg

# Register the bot's commands
RUN npm register

# Command to run the application
CMD ["npm", "start"]
