# Open Source BI with Metabase

## Goals:
- Learn Metabase
- Practice Docker and CLI
- Learn about Open Source Software (OSS) use case. You should be able to talk about pros and cons of OSS vs Tableau/Looker/Power BI and think about cool use cases.

## Add data to Postgres

```
# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=postgres

# Copy the CSV files into a directory inside the container
COPY csv /var/lib/postgresql/csv

# Copy the initialization scripts into the Docker entrypoint directory
COPY pg-init.d /docker-entrypoint-initdb.d

# Expose the PostgreSQL port (default 5432)
EXPOSE 5432

# Run the PostgreSQL server
CMD ["postgres"]
```

Run commands:

```
docker build -t postgres_image .

docker run -d -p 5433:5432 --name postgres_container postgres_image

```

<img width="662" alt="Screenshot 2024-12-29 202044-2" src="https://github.com/user-attachments/assets/849c1c22-0484-4b99-9497-b7367d8ffc80" />

