CREATE OR REPLACE PROCEDURE raw_data.raw_video_detail(abs_path_of_csv text, country_name text)
    LANGUAGE plpgsql
AS
$$
BEGIN
        EXECUTE FORMAT('TRUNCATE TABLE raw_data.raw_video_detail RESTART IDENTITY CASCADE');
        EXECUTE FORMAT(
        'COPY raw_data.raw_video_detail
        FROM %L
        (
        DELIMITER '','',
        FORMAT CSV,
        ENCODING ''LATIN1'');', abs_path_of_csv);
        EXECUTE FORMAT('ALTER TABLE raw_data.raw_video_detail
                        ADD country VARCHAR');
        EXECUTE FORMAT('UPDATE raw_data.raw_video_detail SET country = %L WHERE country IS NULL', country_name);
        EXECUTE FORMAT('INSERT INTO raw_data.raw_archive_video_detail(video_id,
                                       trending_date,
                                       title,
                                       channel_title,
                                       category_id,
                                       publish_time,
                                       tags,
                                       views,
                                       likes,
                                       dislikes,
                                       comment,
                                       thumbnail_link,
                                       comments_disabled,
                                       ratings_disabled,
                                       video_error_or_removed,
                                       description,
                                       country)
                       SELECT *
                       FROM raw_data.raw_video_detail WHERE video_id NOT IN (SELECT video_id
                                                                        FROM raw_data.raw_archive_video_detail
                                                                        WHERE country = %L)
                                                                    AND trending_date NOT IN (SELECT video_id
                                                                    FROM raw_data.raw_archive_video_detail
                                                                    WHERE country = %L)', country_name, country_name);
        EXECUTE FORMAT('ALTER TABLE raw_data.raw_video_detail
                        DROP COLUMN country');
        END;
$$;
