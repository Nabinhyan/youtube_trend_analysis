CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_date(
    id SERIAL PRIMARY KEY,
    trending_date date,
    publish_date date,
    days_for_trending INT
);