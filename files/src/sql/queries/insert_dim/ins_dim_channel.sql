TRUNCATE TABLE dimension.dim_channel RESTART IDENTITY CASCADE;

INSERT INTO dimension.dim_channel(channel_title)
SELECT DISTINCT channel_title
FROM transformed.transformed_video_detail;
