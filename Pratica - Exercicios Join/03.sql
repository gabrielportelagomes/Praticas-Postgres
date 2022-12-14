SELECT users.id, users.name, courses.name AS course, schools.name AS school, educations."endDate" AS "endDate" FROM users 
JOIN educations ON educations."userId"=users.id 
JOIN courses ON courses.id=educations."courseId" 
JOIN schools ON schools.id=educations."schoolId" 
WHERE users.id=30 AND educations.status='finished';