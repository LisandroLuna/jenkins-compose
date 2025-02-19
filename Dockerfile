FROM jenkins/jenkins:lts-jdk17
# Switch to root user
USER root
# Install dependencies
RUN apt-get update && apt-get install -y \
    lsb-release \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*
# Install Docker CLI (from official Debian repo)
RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*
# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins
# Switch back to Jenkins user
USER jenkins
# Expose Jenkins default port
EXPOSE 8080
# Define the entrypoint
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]