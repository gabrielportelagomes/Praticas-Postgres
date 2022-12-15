SELECT * FROM roles WHERE name='Software Engineer';

SELECT schools.id, schools.name, courses.name AS name, companies.name AS company, roles.name AS role FROM jobs 
JOIN applicants ON applicants."jobId"=jobs.id 
JOIN educations ON educations."userId"=applicants."userId" 
JOIN schools ON schools.id=educations."schoolId" 
JOIN courses ON courses.id=educations."courseId" 
JOIN companies ON companies.id=jobs."companyId" 
JOIN roles ON roles.id=jobs."roleId" 
WHERE jobs.active=true AND jobs."roleId"=2 AND jobs."companyId"=10;