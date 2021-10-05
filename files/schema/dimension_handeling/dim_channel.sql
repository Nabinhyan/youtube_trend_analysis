CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_channel(
    id SERIAL PRIMARY KEY,
    channel_title VARCHAR
);