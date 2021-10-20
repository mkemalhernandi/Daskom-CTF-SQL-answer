CREATE DATABASE ctf_triptodatabase;
USE ctf_triptodatabase;

-- A TRIP TO THE DATABASE CHALLENGE


SELECT * FROM information_schema.columns
WHERE column_name='flag';


-- FLAG AMONGST FLAGS CHALLENGE


SELECT flag
FROM fl4gh0ld3r
WHERE flag LIKE ('dctf1337{%}')
ORDER BY length(flag) ASC;


-- THE CURSE OF THE HOARDER


SELECT user_id, COUNT(*) as total_transactions
FROM transactions
GROUP BY user_id
ORDER BY total_transactions DESC;

SELECT id,username
FROM users
WHERE id=664;


-- MESSY GUESSY FLAG PUZZLE


with cte as
(SELECT user_id
FROM transactions as t
JOIN fl4gh0ld3r as f
ON t.flag_id=f.id
JOIN users as u 
ON u.id=t.user_id
where isGuessy=1 and flag LIKE 'dctf%'),

cte2 as(
SELECT u.id as user_id,f.id as flag_id,flag
FROM transactions as t
JOIN fl4gh0ld3r as f
ON t.flag_id=f.id
JOIN users as u 
ON u.id=t.user_id
CROSS JOIN cte
where isGuessy=1 and t.user_id=cte.user_id
order by u.id,f.id asc
),

cte3 as (SELECT GROUP_CONCAT(flag ORDER BY flag_id SEPARATOR '') as concat_flag
FROM cte2
GROUP BY cte2.user_id)

SELECT *
FROM cte3 
where concat_flag LIKE ('dctf1337{%}')

