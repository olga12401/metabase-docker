# Open Source BI with Metabase

## Goals:
- Learn Metabase
- Practice Docker and CLI
- Learn about Open Source Software (OSS) use case. You should be able to talk about pros and cons of OSS vs Tableau/Looker/Power BI and think about cool use cases.

## What This Project Demonstrates

- Docker-based data infrastructure
- Analytics engineering with dbt
- Clean data modeling (raw → _staging → _analytics)
- Data quality testing
- Documentation-first development
- BI dashboards built on analytics tables
- Easy local rebuild & onboarding

## Architecture

```
CSV Files
   ↓
PostgreSQL (raw schema)
   ↓
dbt (staging → analytics)
   ↓
Metabase Dashboards

```
## Schema Layers

```
| Schema       | Description                          |
| -----------  | ------------------------------------ |
| `raw`        | Source-of-truth data loaded from CSV |
| `_staging`   | Cleaned dbt views                    |
| `_analytics` | Business-ready dbt tables            |
```

## Repository Structure

```
.
├── docker-compose.yml
├── postgres/
│   ├── csv/
│   └── pg-init.d/
├── dbt/
│   ├── models/
│   │   ├── stg/
│   │   ├── marts/
│   │   ├── schema.yml
│   │   ├── sources.yml
│   │   └── exposures.yml
│   ├── macros/
│   └── profiles/
└── README.md

```

## Prerequisites
Make sure you have installed:

- Docker
- Docker Compose (v2+)
- Git

Check versions:

```
docker --version
docker compose version
git --version
```

## Setup and Run (Step by Step)

### Create .env file

```
POSTGRES_USER=admin
POSTGRES_PASSWORD=admin123
POSTGRES_DB=postgres_metabase1
METABASE_EMAIL=
METABASE_PASSWORD=

```

### Start all services
```
docker compose up -d

-- Check that containers are running:
docker compose ps
--Run dbt models

docker compose exec dbt dbt run

--Run tests:
docker compose exec dbt dbt test

```
### Generate dbt documentation
```
docker compose exec dbt dbt docs generate
docker compose exec dbt dbt docs serve --port 8080

```
Open:

👉 dbt Docs → http://localhost:8080

### Open Metabase

Open Metabase in your browser:

👉 http://localhost:3000

During first setup:

- Database: PostgreSQL
- Host: ```postgres```
- Port: ```5432```
- Database name: ```postgres_metabase1```
- Username
- Password

After setup:

- Go to Admin → Databases
- Sync database schema
- Enable schema: ```analytics```
- Hide schema: ```raw```

### Analytics Tables Used in Dashboards

Dashboards are built only on analytics tables.


## Stop / Restart Project

Stop / Restart Project:
```
docker compose down

```

Full reset (delete data):

```
docker compose down -v

```

Restart:
```
docker compose up -d

```

## Design Notes

- All business logic lives in dbt
- Metabase is used only for visualization
- Dashboards do not contain transformation logic
- Negative profit values are preserved for analysis
- Project is fully runnable via documented commands

Built as a learning project using open-source analytics tools.

