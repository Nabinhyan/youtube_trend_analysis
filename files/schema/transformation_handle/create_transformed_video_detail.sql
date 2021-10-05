CREATE SCHEMA IF NOT EXISTS transformed;

CREATE TABLE IF NOT EXISTS transformed.transformed_video_detail
(
    id SERIAL PRIMARY KEY,
    video_id VARCHAR,
    trending_date DATE,
    title VARCHAR,
    channel_title VARCHAR,
    category_id INT,
    publish_date DATE,
    publish_time TIME,
    views BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comments BIGINT,
    comments_disabled BOOLEAN,
    ratings_disabled BOOLEAN,
    video_error_or_removed BOOLEAN,
    country VARCHAR
);