SELECT *
FROM raw_data.raw_archive_video_detail
WHERE video_id ISNULL
    OR title ISNULL;
