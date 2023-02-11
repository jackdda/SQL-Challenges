/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge for which the submission belongs to, and score is the score of the submission. 
*/
SELECT h.hacker_id, h.name, SUM(best.scores)
FROM (
    SELECT s.hacker_id, s.challenge_id, MAX(s.score) AS scores
    FROM Submissions s
    GROUP BY s.hacker_id, s.challenge_id
    ) AS best
JOIN hackers h
    ON h.hacker_id = best.hacker_id
GROUP BY h.name, h.hacker_id 
HAVING SUM(best.scores) > 0
Order by SUM(best.scores) DESC, h.hacker_id