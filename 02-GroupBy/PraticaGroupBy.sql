-- Exercício 1
SELECT COUNT("endDate") as "currentExperiences" FROM experiences;

-- Exercício 2
SELECT "userId" AS id, COUNT("userId") AS educations 
FROM educations 
GROUP BY "userId"

-- Exercício 3
SELECT users.name AS writer, COUNT(testimonials."recipientId") as "testimonialCount" 
FROM testimonials 
JOIN users 
ON testimonials."writerId" = users.id 
WHERE users.id = 435 
GROUP BY writer

-- Exercício 4
SELECT MAX(jobs.salary) AS "maximumSalary", roles.name as role
FROM jobs
JOIN roles ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY role
ORDER BY "maximumSalary"

-- Bônus
SELECT schools.name AS school, courses.name course, COUNT(educations.id) AS "studentsCount", educations.status AS status
FROM educations
JOIN courses ON educations."courseId" = courses.id
JOIN schools ON educations."schoolId" = schools.id
WHERE educations.status = 'ongoing' OR educations.status = 'finished'
GROUP BY schools.name, courses.name, educations.status
ORDER BY "studentsCount" DESC
LIMIT 3
