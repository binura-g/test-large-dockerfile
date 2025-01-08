# Use a lightweight base image
FROM alpine:latest

# Set the working directory
WORKDIR /data

# Install necessary tools
RUN apk add --no-cache coreutils

# Generate 20GB of garbage data during the build process 
# RUN dd if=/dev/urandom of=/data/tmp.file.bin bs=128MB count=160

# 10GB 
# RUN dd if=/dev/urandom of=/data/tmp.file.bin bs=128MB count=80

# 5GB
# RUN dd if=/dev/urandom of=/data/tmp.file.bin bs=128MB count=40

# 1.28GB
RUN dd if=/dev/urandom of=/data/tmp.file.bin bs=128MB count=10

RUN adduser \
  --disabled-password \
  --uid 10014 \
  "choreo"

USER 10014

# Default command
CMD ["ls", "-lh", "/data"]
