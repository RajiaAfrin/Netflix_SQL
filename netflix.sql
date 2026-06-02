--netflix project
Drop table if exists netflix;
Create Table netflix
(
show_id varchar(6),
type varchar(10),	
title varchar(150),
director varchar(208),	
casts varchar(1000),	
country varchar(150),
date_added varchar(50),
release_year INT,
rating varchar(10),
duration varchar(15),
listed_in varchar(100),
description varchar (250)
);
select * from netflix;

select count (*) as total_content
from netflix;

select distinct type
from netflix;

--15 business problems
--1.count the number of movies and number of tv shows 
select  type,
count(*) as total_content
from netflix
group by type

--find the most common rating for the movies and tv shows
select type, rating
from
(
select 
    type, 
    rating,
	Count(*) as numbers_rating,
	rank() over(partition by type order by count(*) desc) as ranking
from netflix
group by 1, 2
) as t1
where 
    ranking = 1

--list all movies realesed in a specific year (2020)
select * from netflix
where type = 'Movie' and release_year = 2020

--find the top 5 countries with the most content on netflix ****
select unnest (string_to_array(country,',' )) as new_country,-- use unnest when one cell contains multiple values and you want to split them into separate rows.
	   Count(show_id) as total_content
from netflix
group by 1 
order by total_content desc
limit 5;
--identify the longest movie***  
SELECT *
FROM netflix
WHERE type = 'Movie'
  AND duration IS NOT NULL
ORDER BY REPLACE(duration, ' min', '')::INT DESC
LIMIT 1;

--find content added in the last 5 years
select * from netflix 
where To_date(TRIM(date_added), 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

--find all the movies/ TV shows by director 'Rajiv Chilaka'
select * from netflix
where director ILike '%Rajiv Chilaka%' --using Ilike just to make it not case sensative ..otherwise like was fine

--List all TV shows with more than 5 season
SELECT *
FROM netflix
WHERE type = 'TV Show'
  AND REPLACE(REPLACE(duration, ' Seasons', ''), ' Season', '')::INT > 5;

--2nd option
SELECT *
FROM netflix
WHERE type = 'TV Show'
  AND SPLIT_PART(duration, ' ', 1)::NUMERIC > 5;

--count the  number of content items in each genre
select unnest (string_to_array(listed_in,',' )) as genre,
       count(show_id) as number_of_content
from netflix
group by genre 

--find each year and the average numbers of content release by India on netflix.return top 5 year with highest avg content release.
SELECT EXTRACT(YEAR FROM TO_DATE(TRIM(date_added), 'Month DD, YYYY')) AS year_added,
       COUNT(*) AS yearly_content,
       ROUND(
           COUNT(*)::NUMERIC / (
               SELECT COUNT(*)
               FROM netflix
               WHERE country ILIKE '%India%'
                 AND date_added IS NOT NULL
           )::NUMERIC * 100,
           2
       ) AS avg_content_per_year
FROM netflix
WHERE country ILIKE '%India%'
  AND date_added IS NOT NULL
GROUP BY year_added
ORDER BY avg_content_per_year DESC
LIMIT 5;

--list all the movies that are documentaries
select * from netflix
where type = 'Movie' and
listed_in ILIKE '%documentaries%';

--Find all content without a director
select * from netflix
where director is null

--find how many movies actor 'salman khan' appeard in last 10 years
select * from netflix
where casts ILIKE '%salman khan%'
and
release_year>EXTRACT(YEAR FROM CURRENT_DATE)-10

--FIND THE TOP 10 ACTORS WHO HAVE APPEARED IN THE HIGHEST NUMBER OF MOVIES PRODUCED IN INDIA
select 
TRIM(unnest (STRING_TO_ARRAY(casts,',' ))) as casts,
count(*) as total_content
from netflix
where type = 'Movie' and country  ILIKE '%india%'
group by 1
order by 2 desc
limit 10

--Categorize the content based on the presence of the keywords `'kill'` and `'violence'`in the `description` field. Label content containing these keywords as `'Bad'` and allother content as `'Good'`. Count how many items fall into each category.
SELECT category,
       COUNT(*) AS total_content
FROM (
    SELECT CASE
               WHEN description ILIKE '%kill%'
                 OR description ILIKE '%violence%'
               THEN 'Bad'
               ELSE 'Good'
           END AS category
    FROM netflix
) t
GROUP BY category;

