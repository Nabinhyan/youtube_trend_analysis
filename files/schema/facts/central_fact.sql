CREATE SCHEMA IF NOT EXISTS facts;

CREATE TABLE IF NOT EXISTS facts.central_facts
(
    id                     SERIAL PRIMARY KEY,
    video_id               INT,
    channel_id             INT,
    trending_id            INT,
    category_id            INT,
    publish_time_id        INT,
    views                  BIGINT,
    likes                  BIGINT,
    dislikes               BIGINT,
    comments               BIGINT,
    comments_disabled      BOOLEAN,
    ratings_disabled       BOOLEAN,
    video_error_or_removed BOOLEAN,
    country_id             INT,
    FOREIGN KEY (video_id) REFERENCES dimension.dim_video (id),
    FOREIGN KEY (channel_id) REFERENCES dimension.dim_channel (id),
    FOREIGN KEY (trending_id) REFERENCES dimension.dim_date (id),
    FOREIGN KEY (category_id) REFERENCES dimension.dim_category (category_id),
    FOREIGN KEY (publish_time_id) REFERENCES dimension.dim_time(id),
    FOREIGN KEY (country_id) REFERENCES dimension.dim_country (id)
);
