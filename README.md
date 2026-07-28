# SQL for Data Platforms

A complete, executable SQL curriculum — 14 modules, from first `SELECT` to procedural SQL and
cross-platform syntax — built to run entirely on a laptop with **no server, no cloud account, and
no heavy database install**. Every module is a self-contained, independently runnable Jupyter
notebook (or, where a live cloud account can't reasonably be simulated, a carefully
accuracy-guardrailed reference notebook) against one shared synthetic "Store" dataset.

This is the code companion to the **"SQL for Every Data Platform"** publication series at
[mzamudio.com](https://www.mzamudio.com/publications/sql-fundamentals.html).

## Objective

Cover the SQL a working data analyst/engineer actually needs, end to end:
- **Fundamentals → advanced querying**: DDL/DML/DQL, JOINs, aggregations, subqueries, CTEs, window
  functions.
- **Schema design**: star vs. snowflake dimensional modeling, written as real DDL.
- **Data prep**: cleaning/formatting (dates, numbers, labels) and semi-structured/JSON parsing.
- **Production patterns**: the query cookbook, Slowly Changing Dimensions + incremental/delta
  loading, performance tuning (indexes, partitioning/clustering, views), and dbt as a lightweight
  local governance/testing layer.
- **Beyond declarative SQL**: procedural SQL (stored procedures, triggers — PL/pgSQL, with
  reference coverage of Oracle PL/SQL and SQL Server/Fabric T-SQL).
- **The platform landscape**: SQL syntax differences across BigQuery, Snowflake, Databricks SQL,
  Microsoft Fabric, and Amazon Redshift, and how to choose between OLTP engines, cloud warehouses,
  and embedded/local databases.

## Dataset

A synthetic "Store" database (customers, products, orders, order_items, employees) — the same
dataset used throughout, so examples build on each other module to module.

## Method

Python's `sqlite3` (stdlib) and **DuckDB** for everything in-memory/local — no external server
required for 13 of the 14 modules. Module 11 (Procedural SQL) additionally uses a **Docker
Postgres** container for its one runnable PL/pgSQL demo, since neither SQLite nor DuckDB support
real procedural blocks — this is the only module in the repo that isn't zero-install, and it's
flagged as optional in its own notebook. `pandas` renders query results as tables. Two helper
functions (`sql()` for SELECT queries, `execute()` for DDL/DML) are established in each notebook's
setup cell, following the same convention used across Mario's other SQL reference work.

## Setup

```bash
python -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
jupyter lab
```

Run notebooks in order — each is independently runnable, but later modules build on earlier ones
(e.g. Module 8's SCD demo reuses Module 2's schema):

| # | Notebook | Module |
|---|----------|--------|
| 1 | `notebooks/Part01.Fundamentals.DDL.DML.DQL.ipynb` | SQL Fundamentals |
| 2 | `notebooks/Part02.SchemaDesign.StarSnowflake.ipynb` | Designing the Schema: Star vs. Snowflake |
| 3 | `notebooks/Part03.Joins.Aggregations.ipynb` | Joins & Aggregations |
| 4 | `notebooks/Part04.Subqueries.CTEs.WindowFunctions.ipynb` | Subqueries, CTEs & Window Functions |
| 5 | `notebooks/Part05.DataCleaning.Formatting.ipynb` | Data Cleaning & Formatting with SQL |
| 6 | `notebooks/Part06.JSON.SemiStructuredData.ipynb` | Semi-Structured Data & JSON in SQL |
| 7 | `notebooks/Part07.QueryCookbook.ipynb` | The Query Cookbook: Day-to-Day Patterns |
| 8 | `notebooks/Part08.SCD.IncrementalLoading.ipynb` | Slowly Changing Dimensions & Incremental Loading |
| 9 | `notebooks/Part09.PerformanceTuning.ipynb` | Query Performance & Tuning |
| 10 | `notebooks/Part10.LocalSimulation.dbt.Governance.ipynb` | Simulating a Platform Locally (dbt & Governance) |
| 11 | `notebooks/Part11.ProceduralSQL.PLpgSQL.ipynb` | Procedural SQL: Stored Procedures, Triggers & PL/SQL |
| 12 | `notebooks/Part12.SyntaxAcrossPlatforms.ipynb` | Same Query, Every Platform |
| 13 | `notebooks/Part13.ChoosingYourDatabase.ipynb` | Choosing Your Database |
| 14 | `notebooks/Part14.StyleBestPractices.ipynb` | SQL Style & Best Practices |

Module 10 also drives a real, self-contained **dbt-duckdb** project under `dbt/` (seeds, models,
macros, tests) via `subprocess` calls to the `dbt` CLI — same pattern as the reference project this
repo grew out of. Module 11's optional Postgres container is started with:

```bash
docker compose -f docker/docker-compose.yml up -d
```

## Key Results

A structured, annotated, **output-verified** SQL reference spanning 14 topic areas, executable
top to bottom with no paid infrastructure — plus one small optional Docker Postgres container for
the one topic (procedural SQL) that genuinely needs a real server.

## Provenance

Modules 1, 3, 4, 7, and 10 are adapted from `sql-concepts-masterclass`, a private SQL reference
project in Mario's `data-analytics-knowledge-base` vault (itself sourced from 49 real SQL files
from his MDA SQL Databases course — Sakila DB, Classic Models, and the Bicycle Store capstone).
The remaining modules (2, 5, 6, 8, 9, 11, 12, 13, 14) are new, written for this repo to close gaps
identified when auditing that vault for this series: schema design, data cleaning, semi-structured
data, SCD/incremental loading, expanded performance tuning, procedural SQL, cross-platform syntax,
database selection, and style/best practices.

## Notes

- **Accuracy guardrail (Modules 11 & 12):** platform-specific claims about Oracle PL/SQL, SQL
  Server/Fabric T-SQL, BigQuery, Snowflake, Databricks SQL, and Amazon Redshift are kept at the
  capability level and explicitly flagged for verification against current vendor docs — none of
  these are live-tested against a real cloud account or licensed database from this repo.
- No large/raw data is committed; the synthetic dataset is generated in-notebook every run.
