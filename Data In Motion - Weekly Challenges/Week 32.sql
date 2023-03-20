/* Challenge #1
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

/* Challenge #2
New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. Users may receive multiple text messages for account confirmation until they have confirmed their new account.

Write a query to find the activation rate of the users. Round the percentage to 2 decimal places.

Definitions:
emails table contain the information of user signup details.
texts table contains the users' activation information.
*/

SELECT ROUND(
  1.0 * COUNT(*) / 
  (SELECT COUNT(email_id) FROM emails)
  , 2) AS confirm_rate
FROM texts
WHERE signup_action = 'Confirmed'