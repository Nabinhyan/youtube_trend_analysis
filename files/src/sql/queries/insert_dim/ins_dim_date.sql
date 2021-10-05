TRUNCATE TABLE dimension.dim_date RESTART IDENTITY CASCADE;

INSERT INTO dimension.dim_date(trending_date, publish_date, days_for_trending)
SELECT DISTINCT trending_date,
                publish_date,
                (trending_date::date - publish_date::date) as days
FROM transformed.transformed_video_detail;
