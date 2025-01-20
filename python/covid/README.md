# Covid19 Analysis
Visualization of Covid19 data sourced from Johns Hopkins and blended with various demographics datasets.

### Overview
- Description: Visualizations on Covid19 data provided by Johns Hopkins University and demographic data pulled from various sources
- Technology: Prophet, Machine Learning, Pandas, RegEx, MatPlotLib
- Dashboards
    - State-Level Cases vs. Deaths over Time
        - Filters: state (req'd)
        - Metrics: cases, deaths
        - Options: w/ or w/o population adjustment
    - County-Level Heat Map - Cases / Deaths
        - Filters: state (req'd)
        - Metrics: cases, deaths
        - Options: w/ or w/o population adjustment
    - State-Level Heat Map - Testing Rates
        - Filters: state (optional)
        - Metrics: testing rate (per X population)

### Tech
...

### Data Sources

##### Johns Hopkins University
[GitHub Repo](https://github.com/CSSEGISandData/COVID-19)

##### AWS Covid19 Data Lake
...

##### US Census Bureau
...

### Preprocessing
...

### Vizualization
...

---

### Next Steps
##### Forecasting
- Problem: create a model to forecast Covid19 deaths.
- Factors
  - IVs
    - (+ opportunities) Population
      - Reasoning
          - Any individual within a given region is an "opportunity" for a Covid19 case
      - Data
          - File: COVID-JHU-FIPS
          - Field: POPULATION
          - Filters: FIPS
    - (- risk factor) County size (acreage)
      - Reasoning
          - Higher population density will make transmission harder to avoid (e.g. NYC)
          - Correlated with population? Eliminate this by just using the acreage in a geographic location?
      - Data
          - File: DEMO-CB-GEO
          - Field: ALAND
          - Filters: geoid (FIPS)
    - (+ risk factor) % population undergoing hardship
      - Reasoning
        - Potential variables: % pop under US poverty line, % pop unemployed, ...
      - Data
          - File: DEMO-CB-POV
          - Field: ALL AGES IN POVERTY PERCENT
          - Filters: year, county id (FIPS)
    - (- risk factor) Covid19 tests per 1,000 population
      - Reasoning
          - More tests per residents in population suggested an increased awareness and emphasis on reducing transmission
          - Reasonable to believe that this would be a proxy for the ideal input - degree of Covid19 restrictions in a geographical area
          - **Only state level data available**
              - That's acceptable since most Covid19 prevention efforts stem from state legislation
              - **Need a better proxy - county level is ideal**
      - Data
          - File: COVID-JHU-DLY-US
          - Field: TESTING_RATE
          - Filters: FIPS / PROVINCE_STATE
  - DV
    - Covid19 deaths per week by county
    - Data
        - File: COVID-JHU-TS
        - Field: DEATHS
        - Filters: FIPS
- Considerations
  - Timeseries aspect of the data will impact results
    - Reason: any individual who has contracted Covid19 will be significantly less likely to catch it again
    - Remediation: for any given month, reduce the population count by the number of positive Covid19 cases from the previous month