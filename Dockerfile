# fresh image to reduce size
FROM simulationcraftorg/simc:latest

# Install curl to download the script
RUN apk add --no-cache curl bash git figlet

# Create directory
WORKDIR /app/SimulationCraft
VOLUME /opt/outside

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]