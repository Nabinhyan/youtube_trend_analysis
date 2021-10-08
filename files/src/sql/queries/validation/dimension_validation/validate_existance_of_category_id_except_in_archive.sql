SELECT category_id
FROM dimension.dim_category
EXCEPT
SELECT CAST(category_id AS INT)
FROM raw_data.raw_archive_category;
