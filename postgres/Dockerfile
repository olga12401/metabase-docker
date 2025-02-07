# Use the official PostgreSQL image
FROM postgres:latest

# Set the database name using environment variables
ENV POSTGRES_DB=postgres_metabase1


# Copy CSV files into the container
COPY csv /var/lib/postgresql/csv

# Copy initialization scripts into the container
COPY pg-init.d /docker-entrypoint-initdb.d

# Expose PostgreSQL default port
EXPOSE 5432

# Run the PostgreSQL server with environment variable support for secrets
CMD ["postgres"]



