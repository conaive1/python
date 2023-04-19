FROM python:3.9-slim-buster

# Add a new user
RUN groupadd -r myuser && useradd -r -g myuser myuser

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages and generate requirements.txt
RUN pip install --no-cache-dir Flask && \
    pip freeze > requirements.txt

# Copy app code
COPY . .

# Change the ownership of /app to myuser
RUN chown -R myuser:myuser /app

# Change to myuser
USER myuser

# Expose port 80
EXPOSE 80

# Run the app
CMD ["python", "hello.py"]
