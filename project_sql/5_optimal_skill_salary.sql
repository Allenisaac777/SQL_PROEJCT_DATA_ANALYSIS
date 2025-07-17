select 
    skills_dim.skill_id,
	count(job_postings_fact.job_id) as job_count,
    job_title_short,
    skills_dim.skills,
    salary_year_avg
from 
    job_postings_fact
left join skills_job_dim
    on  job_postings_fact.job_id = skills_job_dim.job_id
left join skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
where 
    salary_year_avg is not null  and job_title_short='Data Analyst'
group by job_postings_fact.job_id,skills,skills_dim.skill_id
order by salary_year_avg DESC, job_count DESC
limit 100; 