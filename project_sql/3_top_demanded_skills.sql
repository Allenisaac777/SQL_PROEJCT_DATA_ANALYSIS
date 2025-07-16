select 
    count(skill_id) as skill_count,
    skills,
    type as skill_type   
FROM
    skills_dim
