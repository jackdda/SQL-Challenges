/*
Show unique first names from the patients table which only occurs once in the list.

For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.
*/
SELECT p.first_name
  FROM patients p 
  GROUP by p.first_name
  Having COUNT(p.first_name) = 1