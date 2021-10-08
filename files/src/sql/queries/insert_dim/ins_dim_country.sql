TRUNCATE TABLE dimension.dim_country RESTART IDENTITY CASCADE;

INSERT INTO
    dimension.dim_country(country_name)
SELECT
    DISTINCT country
FROM
    transformed.transformed_video_detail;