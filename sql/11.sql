/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT first_name || ' ' || last_name AS "Actor Name"
FROM (
    SELECT first_name, last_name, unnest(special_features) AS feature
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
) t
WHERE feature = 'Behind the Scenes'
GROUP BY "Actor Name"
ORDER BY "Actor Name";
