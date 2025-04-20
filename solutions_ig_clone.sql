USE ig_clone;

-- 1. Find the oldest 5 users

SELECT username, created_at FROM users
ORDER BY created_at
LIMIT 5;

-- 2. Most popular registration date (day)

SELECT  
	DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- 3. to target the inactive users with an email campaign
-- Find the inactive users (with no photos)

SELECT username, user_id
FROM users LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Identify the most popular photo and the user who created it

SELECT 
	username,
    photos.id,
    photos.image_url,
    COUNT(*) AS Total
FROM photos
INNER JOIN likes
	ON photos.id = likes.photo_id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY Total DESC
LIMIT 1;

-- 5. Calculate the average number of photos per user
SELECT 
(SELECT Count(*) FROM  photos) / (SELECT Count(*) FROM users) AS avg; 

-- 6. The top 5 most commonly used hashtags
SELECT tags.tag_name, 
       Count(*) AS total 
FROM photo_tags 
	INNER JOIN tags 
	ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

-- 7. Finding bots
-- Find the users who have liked every single photos on the site
SELECT username, 
       Count(*) AS num_likes 
FROM users 
	INNER JOIN likes 
	ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) FROM photos); 



