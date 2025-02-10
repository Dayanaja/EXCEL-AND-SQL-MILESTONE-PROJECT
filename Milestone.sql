
use milestone;
select*from salary_2021_csv;


/*1. Average Salary by Industry and Gender */

select industry, gender, round(
avg (annual_salary),2) as avg_salary
from salary_2021_csv
group by industry;

/*2. Total Salary Compensation by Job Title */
select
job_title,
	(additional_monetary_compensation) as total_salary_compensation
from
	salary_2021_csv
group by
	job_title
order by
	total_salary_compensation DESC;
    
/*3. Salary Distribution by Education Level */

select qualification,round(
avg(annual_salary),2)as avg_salary,
min(annual_salary) as min_salary,
max(annual_salary) as max_salary,
abs(min(annual_salary)-max(annual_salary)) as Distribution
from salary_2021_csv
group by qualification
order by qualification;

/*4. Number of Employees by Industry and Years of Experience */

select industry, Professional_Experience,count(Age_Range) num_employees
from salary_2021_csv
group by professional_Experience, industry
order by num_employees desc;

/*5. Median Salary by Age Range and Gender */
WITH ranked_salaries as(
select Annual_Salary,
Age_Range,gender,
	ROW_NUMBER()OVER(PARTITION BY Age_Range,Gender ORDER BY ANNUAL_SALARY) AS row_num,
    count(*)over (partition by age_range, gender)as total_count 
    from salary_2021_csv
    )
    select Age_Range, gender,
    case
    when total_count % 2=1 then
    max(case when row_num=(total_count+1)/2 then Annual_Salary END)
    else
    avg(case when row_num IN (total_count/2,total_count/2+1)then annual_salary end)
    end as median_salary
    from ranked_salaries
    group by age_range, gender
    order by age_range;
    


/*6.
/*7.. Average Salary by City and Industry */
select city, industry, avg (annual_salary) as avg_salary
from salary_2021_csv
group by city, industry
order by city, industry;

/*8. Percentage of Employees with Additional Monetary Compensation by Gender*/
select
gender,
round(
(count (case when additional_monetary_compensation >0




    
    
    

