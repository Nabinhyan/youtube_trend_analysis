TRUNCATE TABLE dimension.dim_category RESTART IDENTITY CASCADE;

INSERT INTO dimension.dim_category(category_id, category)
SELECT DISTINCT CAST(category_id AS INT) AS category_id, category
FROM raw_data.raw_archive_category;
