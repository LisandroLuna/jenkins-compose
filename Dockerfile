FROM jenkins/jenkins:lts

# Switch to root to install dependencies
USER root

# Install Docker CLI (optional, for running Docker inside Jenkins)
RUN apt-get update && apt-get install -y \
    sudo \
    lsb-release \
    curl \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# Add Jenkins user to the Docker group
RUN usermod -aG docker jenkins

# Switch back to Jenkins user
USER jenkins

# Expose Jenkins default port
EXPOSE 8080

# Define the entrypoint
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

