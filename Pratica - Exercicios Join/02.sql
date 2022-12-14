SELECT testimonials.id, t1.name AS writer, t2.name AS recipient, testimonials.message FROM testimonials 
JOIN users t1 ON t1.id="writerId" 
JOIN users t2 ON t2.id="recipientId";