CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_country(
    id SERIAL PRIMARY KEY,
    country_name VARCHAR
);
