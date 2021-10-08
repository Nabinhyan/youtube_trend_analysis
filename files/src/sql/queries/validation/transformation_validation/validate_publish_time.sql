SELECT *
FROM transformed.transformed_video_detail
WHERE publish_time > '' 23 :59 :59 ''::TIME;
