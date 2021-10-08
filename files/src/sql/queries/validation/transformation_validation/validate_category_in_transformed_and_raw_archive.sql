SELECT CAST(category_id AS INT) AS category_id
FROM transformed.transformed_video_detail
EXCEPT
SELECT CAST(category_id AS INT) AS category_id
FROM raw_data.raw_archive_video_detail;
