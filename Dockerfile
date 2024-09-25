# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application code into the container
COPY . .

# Generate self-signed certificate
RUN apt-get update && \
    apt-get install -y openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /app/selfsigned.key -out /app/selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# Expose the port FastAPI will run on
EXPOSE 443

# Run the FastAPI app with Uvicorn
CMD ["uvicorn", "chat:app", "--host", "0.0.0.0", "--port", "443", "--reload","--ssl_keyfile","/app/selfsigned.key","--ssl_certfile","/app/selfsigned.crt"]
