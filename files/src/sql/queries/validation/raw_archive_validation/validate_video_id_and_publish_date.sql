SELECT *
FROM transformed.transformed_video_detail
WHERE video_id IS NOT NULL
    AND publish_date ISNULL;
