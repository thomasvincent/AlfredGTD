FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    bash \
    coreutils \
    curl \
    libxml2-utils \
    grep \
    && rm -rf /var/lib/apt/lists/*

# Set up working directory
WORKDIR /app

# Copy the workflow files
COPY . .

# Make scripts executable
RUN chmod +x tests/*.sh

# Run tests by default
CMD ["tests/run_tests.sh"]