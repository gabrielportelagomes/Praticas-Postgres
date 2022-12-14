SELECT * FROM cities WHERE name='Rio de Janeiro';

SELECT users.id, users.name, cities.name AS city FROM users 
JOIN cities ON cities.id="cityId" 
WHERE "cityId"=3658;