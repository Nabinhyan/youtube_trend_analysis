SELECT * FROM raw_data.raw_archive_category
WHERE category_id ISNULL OR (category_id IS NOT NULL AND category ISNULL);
