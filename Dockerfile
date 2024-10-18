ARG NODE_VERSION=8.15-alpine

# Use Node image
FROM node:${NODE_VERSION}

# Install Git
RUN apk --no-cache add git

# Set the working directory inside the container
WORKDIR /app

# Clone the project
RUN git clone https://github.com/Pianissimo7/octopussimo-music-bot.git .

# Install extre dependencies
RUN npm install mediaplex
RUN apt-get install -y --no-install-recommends ffmpeg

# Register the bot's commands
RUN npm register

# Command to run the application
CMD ["npm", "start"]
