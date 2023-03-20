/*
Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

Assumptions:
If two artists' songs have the same number of appearances, the artists should have the same rank.
The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).
*/

SELECT *
FROM (
  SELECT artist_name
    , DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) as artist_rank
  FROM artists a
  JOIN songs s
    ON a.artist_id = s.artist_id
  JOIN global_song_rank g 
    ON g.song_id = s.song_id
  WHERE g.rank <= 10
  GROUP BY artist_name
  ) as Ranked
WHERE artist_rank <= 5