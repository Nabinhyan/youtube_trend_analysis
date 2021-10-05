TRUNCATE TABLE dimension.dim_video RESTART IDENTITY CASCADE;

INSERT INTO dimension.dim_video(video_id, title)
SELECT DISTINCT video_id, title
FROM transformed.transformed_video_detail;
