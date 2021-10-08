TRUNCATE TABLE facts.central_facts RESTART IDENTITY CASCADE;

INSERT INTO
    facts.central_facts(
        video_id,
        channel_id,
        trending_id,
        category_id,
        publish_time_id,
        views,
        likes,
        dislikes,
        comments,
        comments_disabled,
        ratings_disabled,
        video_error_or_removed,
        country_id
    )
SELECT
    vi.id,
    ch.id,
    da.id,
    ca.category_id,
    ti.id,
    views,
    likes,
    dislikes,
    comments,
    comments_disabled,
    ratings_disabled,
    video_error_or_removed,
    co.id AS country
FROM
    transformed.transformed_video_detail tr
    LEFT JOIN dimension.dim_video vi ON tr.video_id = vi.video_id
    AND tr.title = vi.title
    LEFT JOIN dimension.dim_channel ch ON tr.channel_title = ch.channel_title
    LEFT JOIN dimension.dim_date da ON tr.trending_date = da.trending_date
    AND tr.publish_date = da.publish_date
    LEFT JOIN dimension.dim_time ti ON tr.publish_time = ti.publish_time
    LEFT JOIN dimension.dim_category ca ON tr.category_id = ca.category_id
    LEFT JOIN dimension.dim_country co ON tr.country = co.country_name;
    