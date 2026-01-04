# Base image with Python 3.10
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install DBT for Postgres + Dagster
RUN pip install \
    dbt-postgres==1.5.2 \
    dagster==1.12.8 \
    dagster-webserver==1.12.8

# Copy project files
COPY . /app

# Set Dagster home
ENV DAGSTER_HOME=/app/.dagster_home

# Expose port 3000 for Dagit
EXPOSE 3000

# Default command to start Dagster webserver
CMD ["dagster-webserver", "-p", "3000"]