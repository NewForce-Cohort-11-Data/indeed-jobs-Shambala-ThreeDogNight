-- Project_Individual_data_analyst_jobs_20250723

SELECT *
FROM data_analyst_jobs;


-- Question 1: How many rows are in the data_analyst_jobs table?
-- Answer: 1793
-- SELECT COUNT (*)
-- FROM data_analyst_jobs;
SELECT COUNT (*)
FROM data_analyst_jobs;

-- Question 2: Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
-- Answer: ExxonMobil
-- SELECT company 
-- FROM data_analyst_jobs
-- LIMIT 10;
SELECT company 
FROM data_analyst_jobs
LIMIT 10;

-- Question 3a: How many postings are in Tennessee? 21 
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN';


-- Question 3b: How many are there in either Tennessee or Kentucky?
-- Answer: 27
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN'
OR location = 'KY';

-- Question 4: How many postings in Tennessee have a star rating above 4?
-- Answer: 3
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

-- Question 5: How many postings in the dataset have a review count between 500 and 1000?
-- Answer: 151
SELECT COUNT (title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Question 6: Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?
-- Answer: 
SELECT DISTINCT location, AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location;


-- Question 7: Select unique job titles from the data_analyst_jobs table. How many are there?
-- Answer: 881
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

-- Question 8: How many unique job titles are there for California companies?
-- Answer: 230
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location IN ('CA');

-- Question 9: Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
-- Answer: 
SELECT company, COUNT (company), AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

-- Question 10a: Add the code to order the query in #9 from highest to lowest average star rating. 
-- Answer: 
SELECT company, COUNT (company), AVG (star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

-- Answer 10b. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? Starbucks

-- Answer 10c. What is that rating? 4.099

-- Question 11: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- Answer: 774
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- Question 12a: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
-- Answer: 4
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

-- Question 12b: What word do these positions have in common?
-- Answer: Tableau

-- Question Bonus: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.
--•	Disregard any postings where the domain is NULL.
--•	Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--•	Which 4 industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4? 

-- Answer: Consulting and Business Services, Consumer Goods and Services, 
SELECT DISTINCT ("domain"), title, skill, days_since_posting, ("domain"), COUNT (DISTINCT ("domain")), COUNT (title) AS num_postings
FROM data_analyst_jobs
WHERE skill IN ('SQL') AND domain IS NOT NULL
GROUP BY title, skill, days_since_posting, ("domain")
ORDER BY days_since_posting DESC, num_postings DESC,("domain");
