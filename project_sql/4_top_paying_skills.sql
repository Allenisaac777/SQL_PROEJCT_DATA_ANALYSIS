Select 
skills,
round(avg(salary_year_avg),0) as avg_salary,
job_title

from job_postings_fact
inner join skills_job_dim
    on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim
    on skills_job_dim.skill_id = skills_dim.skill_id
where salary_year_avg IS NOT NULl 
Group BY
    job_title, skills,salary_year_avg
order by avg_salary DESC
limit 100;