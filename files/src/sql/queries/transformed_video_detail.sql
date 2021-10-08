TRUNCATE TABLE transformed.transformed_video_detail RESTART IDENTITY CASCADE;
INSERT INTO transformed.transformed_video_detail(
        video_id,
        trending_date,
        title,
        channel_title,
        category_id,
        publish_date,
        publish_time,
        views,
        likes,
        dislikes,
        comments,
        comments_disabled,
        ratings_disabled,
        video_error_or_removed,
        country
    )
SELECT CASE
        WHEN video_id LIKE '--%%' THEN RIGHT(video_id, LENGTH(video_id) -2)
        WHEN video_id LIKE '-%%' THEN RIGHT(video_id, LENGTH(video_id) -1)
        ELSE video_id
    END AS video_id,
    TO_DATE(trending_date, 'yy.dd.mm'),
    title,
    channel_title,
    CAST(category_id AS INT) AS category_id,
    publish_time::TIMESTAMP::DATE AS publish_date,
    publish_time::TIMESTAMP::TIME AS publish_time,
    CAST(views AS BIGINT) AS views,
    CAST(likes AS BIGINT) AS likes,
    CAST(dislikes AS BIGINT) AS dislikes,
    CAST(comment AS BIGINT) AS comments,
    CAST(comments_disabled AS BOOLEAN) AS comments_disabled,
    CAST(ratings_disabled AS BOOLEAN) AS ratings_disabled,
    CAST(video_error_or_removed AS BOOLEAN) AS video_error_or_removed,
    country
FROM raw_data.raw_archive_video_detail WHERE video_id <> 'video_id';
