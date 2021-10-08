CREATE SCHEMA IF NOT EXISTS raw_data;

CREATE TABLE IF NOT EXISTS raw_data.raw_video_detail(
        video_id VARCHAR,
        trending_date VARCHAR,
        title VARCHAR,
        channel_title VARCHAR,
        category_id VARCHAR,
        publish_time VARCHAR,
        tags VARCHAR,
        views VARCHAR,
        likes VARCHAR,
        dislikes VARCHAR,
        comment VARCHAR,
        thumbnail_link VARCHAR,
        comments_disabled VARCHAR,
        ratings_disabled VARCHAR,
        video_error_or_removed VARCHAR,
        description VARCHAR
);
