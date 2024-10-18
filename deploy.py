import subprocess

def redeploy_container():
    # Stop and remove the existing container if it's running
    subprocess.run(["docker", "stop", "octopussimo-music-bot"])
    subprocess.run(["docker", "rm", "octopussimo-music-bot"])

    # Build the Docker image with no cache
    subprocess.run(["docker", "buildx", "build", "--platform", "linux/amd64", "--no-cache=true", "-t", "octopussimo-music-bot:latest", "."])

    # Run the new container
    subprocess.run(["docker", "run", "--network=host", "-d", "--name", "octopussimo-music-bot", "octopussimo-music-bot:latest"])

if __name__ == "__main__":
    redeploy_container()