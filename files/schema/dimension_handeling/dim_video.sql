CREATE SCHEMA IF NOT EXISTS dimension;

CREATE TABLE IF NOT EXISTS dimension.dim_video(
    id SERIAL PRIMARY KEY,
    video_id VARCHAR,
    title VARCHAR
);
