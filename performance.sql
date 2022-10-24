-- Soal Nomor 1
SELECT ig_username, COUNT(ig_username) AS total_content_2020 
FROM tbl_scraping WHERE ig_username = "Surabaya" AND (taken_at BETWEEN '2020-01-01' AND '2021-01-01');

-- Soal Nomor 2
SELECT ig_username, COUNT(follower_count) as follower_count FROM tbl_scraping GROUP BY ig_username;

-- Soal Nomor 3
SELECT (SELECT MAX(follower_count) FROM tbl_scraping WHERE ig_username = "surabaya" AND taken_at IN 
(SELECT MAX(taken_at) FROM tbl_scraping WHERE ig_username='surabaya' AND (taken_at BETWEEN '2020-01-01' AND '2020-12-31')))
AS f_2020 , (SELECT MAX(follower_count) AS f_2020 FROM tbl_scraping
WHERE ig_username = "surabaya" AND taken_at IN (SELECT MAX(taken_at) FROM tbl_scraping WHERE ig_username='surabaya'
AND (taken_at BETWEEN '2021-01-01' AND '2021-12-31'))) AS f_2021;
