FROM mcr.microsoft.com/devcontainers/java:11

# Set working directory
WORKDIR /workspace

# Install MySQL client (optional, for debugging)
RUN sudo apt update && sudo apt install default-mysql-client -y

# # Set JVM options to suppress SVE warnings
# ENV JAVA_TOOL_OPTIONS="-XX:UseSVE=0"

# Default command (keeps the container running)
CMD ["sleep", "infinity"]
