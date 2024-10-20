import subprocess

def redeploy_container():
    # Stop and remove the existing container if it's running
    subprocess.run(["docker", "stop", "octopussimo-music-bot"])
    subprocess.run(["docker", "rm", "octopussimo-music-bot"])

    # Build the Docker image with no cache
    subprocess.run(["docker", "build", "--platform", "win32/x64", "--no-cache=true", "-t", "octopussimo-music-bot:latest", "."])

    # Run the new container
    subprocess.run(["docker", "run", "--platform", "win32/x64", "--network=host", "-d", "--name", "octopussimo-music-bot", "octopussimo-music-bot:latest"])

if __name__ == "__main__":
    redeploy_container()