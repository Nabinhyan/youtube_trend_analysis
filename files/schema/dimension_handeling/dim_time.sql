CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_time(
    id SERIAL PRIMARY KEY,
    publish_time time,
    publish_shift VARCHAR
);