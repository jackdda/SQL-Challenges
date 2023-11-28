/*Given a table of candidates and their skills, you're tasked with finding the 
candidates best suited for an open Data Science job. You want to find candidates 
who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for 
the job. Sort the output by candidate ID in ascending order. */

SELECT DISTINCT candidate_id
FROM candidates
WHERE candidate_id IN (SELECT candidate_id from candidates where skill = 'Python')
  AND candidate_id IN (SELECT candidate_id from candidates where skill = 'Tableau')
  AND candidate_id IN (SELECT candidate_id from candidates where skill = 'PostgreSQL')