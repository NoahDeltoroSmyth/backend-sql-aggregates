-- rank of film category by times rented
-- include the name, count, and rank

SELECT
	name,
	COUNT(rental_date),
    RANK() OVER (ORDER BY COUNT(rental_date) DESC)
FROM
	category
LEFT JOIN
	film_category
ON
	film_category.category_id = category.category_id
LEFT JOIN
	film
ON
	film.film_id = film_category.film_id
LEFT JOIN
	inventory
ON 
	inventory.film_id = film.film_id
LEFT JOIN
	rental
ON
	rental.inventory_id = inventory.inventory_id
GROUP BY
	name