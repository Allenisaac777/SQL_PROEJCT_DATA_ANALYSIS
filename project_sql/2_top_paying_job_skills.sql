SELECT
    job_postings_fact.job_id,
    job_title,
    job_location,
    salary_year_avg,
    name as company_name,
    skills as job_skills
FROM
    job_postings_fact
LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_DIM
    ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE
     salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
    