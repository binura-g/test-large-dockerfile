# Use a lightweight base image
FROM alpine:latest

# Set the working directory
WORKDIR /data

# Install necessary tools
RUN apk add --no-cache coreutils

# Generate 20GB of garbage data during the build process
RUN dd if=/dev/urandom of=/data/20gb.file.bin bs=128MB count=160

# Default command
CMD ["ls", "-lh", "/data"]
