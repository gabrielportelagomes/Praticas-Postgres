SELECT users.id, users.name, roles.name AS role, companies.name AS company, experiences."startDate" AS "startDate" FROM users 
JOIN experiences ON experiences."userId"=users.id 
JOIN roles ON roles.id=experiences."roleId" 
JOIN companies ON companies.id=experiences."companyId" 
WHERE users.id=50 AND experiences."endDate" IS NULL;