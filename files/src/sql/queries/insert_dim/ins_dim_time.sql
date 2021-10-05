TRUNCATE TABLE dimension.dim_time RESTART IDENTITY CASCADE;

INSERT INTO dimension.dim_time(publish_time, publish_shift)
SELECT DISTINCT
                publish_time,
                CASE
                    WHEN publish_time >= '00:00:00'::TIME AND  publish_time <= '10:59:59'::TIME THEN 'Morning'
                    WHEN publish_time > '10:59:59'::TIME AND publish_time <= '17:59:59'::TIME THEN 'Day'
                    WHEN publish_time > '17:59:59'::TIME AND publish_time <= '20:59:59'::TIME THEN 'Evening'
                    WHEN publish_time > '20:59:59'::TIME AND publish_time <= '23:59:59'::TIME THEN 'Night'
                ELSE NULL
                END AS publish_shift
FROM transformed.transformed_video_detail;