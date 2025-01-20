with
masks as (
  select county_fips_code
    ,round(sum(
      0*never+1*rarely
      +3*sometimes+5*frequently
      +6*always),1) as score
  from bigquery-public-data.covid19_nyt.mask_use_by_county
  group by 1
)
,final as (
  select
    state_name,county
    ,avg(b.score) as mask_score
    ,sum(confirmed_cases) as sum_cases
    ,sum(deaths) as sum_deaths
    ,round(100*sum(deaths)/sum(confirmed_cases),1) as death_rt_pct
  from bigquery-public-data.covid19_nyt.us_counties as a
  inner join masks as b
    on a.county_fips_code=b.county_fips_code
  where a.date between '2020-04-01' and '2020-07-31'
  group by 1,2
  --limit 100
)
select *
from final
where sum_cases>100000 -- sample size
  and death_rt_pct>0 -- bad data?
order by 3 desc
;
