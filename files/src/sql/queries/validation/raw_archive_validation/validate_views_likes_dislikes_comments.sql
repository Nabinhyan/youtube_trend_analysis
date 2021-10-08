SELECT *
FROM transformed.transformed_video_detail
WHERE CAST(views AS INT) < 0
    OR CAST(likes AS INT) < 0
    OR CAST(dislikes AS INT) < 0
    OR CAST(comments AS INT) < 0;
