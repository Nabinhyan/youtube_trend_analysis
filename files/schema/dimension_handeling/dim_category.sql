CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_category(
    category_id SERIAL PRIMARY KEY,
    category VARCHAR
);
