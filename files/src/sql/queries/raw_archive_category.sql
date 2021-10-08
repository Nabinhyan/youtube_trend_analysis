INSERT INTO raw_data.raw_archive_category(
        kind,
        etag,
        category_id,
        channel_id,
        category,
        assignable
    )
SELECT kind,
    etag,
    category_id,
    channel_id,
    category,
    assignable
FROM raw_category
WHERE category_id NOT IN (
        SELECT cast(category_id as int)
        FROM raw_data.raw_archive_category
    )
    AND category NOT IN (
        SELECT category
        FROM raw_data.raw_archive_category
    );
DROP TABLE raw_category;