/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level. 

Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge. 

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission. 
*/
SELECT h.hacker_id, h.name
FROM SUBMISSIONS s
Join Hackers h
on h.hacker_id = s.hacker_id
JOIN (
    SELECT d.difficulty_level, d.score, c.challenge_id, c.hacker_id
    FROM Difficulty d
    JOIN Challenges c
    ON d.difficulty_level = c.difficulty_level
     ) AS diff
ON diff.challenge_id = s.challenge_id
WHERE s.score = diff.score
GROUP BY h.hacker_id, h.name
HAVING count(h.hacker_id) > 1 
Order by count(h.hacker_id) desc, h.hacker_id