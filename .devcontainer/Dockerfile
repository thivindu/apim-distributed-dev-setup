FROM mcr.microsoft.com/devcontainers/java:21

# Set working directory
WORKDIR /workspace

# Install MySQL client (optional, for debugging)
RUN sudo apt update && sudo apt install default-mysql-client -y

# Default command (keeps the container running)
CMD ["sleep", "infinity"]
