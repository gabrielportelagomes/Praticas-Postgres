SELECT users.name AS writer, COUNT("writerId") AS "testimonialCount" FROM testimonials JOIN users ON users.id="writerId" WHERE "writerId"=435 GROUP BY writer;