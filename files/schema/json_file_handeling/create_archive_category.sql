CREATE SCHEMA IF NOT EXISTS raw_data;

CREATE TABLE IF NOT EXISTS raw_data.raw_archive_category(
    kind VARCHAR,
    etag VARCHAR,
    category_id VARCHAR,
    channel_id VARCHAR,
    category VARCHAR,
    assignable VARCHAR
);