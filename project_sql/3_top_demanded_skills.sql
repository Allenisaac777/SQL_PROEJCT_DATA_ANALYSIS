Select 
count(skills_job_dim.job_id) as total_jobs,
skills

from job_postings_fact
inner join skills_job_dim
    on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title='Data Analyst' 
Group BY
    skills
order by total_jobs DESC
limit 10;