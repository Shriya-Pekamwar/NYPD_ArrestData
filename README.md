**NYPD ARREST DATA**
This project focuses on Arrest data from New York, as well as including geographic data from various other regions, states, and cities. The project is structured into four stages, each serving a specific purpose.

**1]Data Staging and Profiling**
In this stage, the data is staged into a staging schema in Snowflake, hosted locally and in the Azure cloud for smooth collaboration with our team. Azure Data Factory was utilized for staging the data. During staging, certain transformations, such as date formatting, are applied to ensure consistency. Data profiling is conducted using Alteryx Data Profiling tool to understand the schema and data consistency. A unified integration schema is devised to accommodate the differing schemas of both datasets within a single Data Warehouse schema.

**2]Data Cleaning**
This stage involves data cleaning processes alongside Data Warehouse Design. A specific ETL process is implemented to remove noisy data, such as locations belonging to areas other than New York.This process included removal of leading and trailing whitespaces, and nulls.The blanks were replaced with NA and numeric values with 0.For missing or null latitude and longitude values, an imputation tool was used. Missing geographic coordinates were replaced with the average values for latitude and longitude based on other entries, ensuring minimal disruption to the spatial integrity of the data. This is achieved by writing an ETL process to filter out irrelevant data. The cleaned data is then staged again, serving as the input for subsequent ETL processes.
Given that the project serves as an introduction to BI concepts, dimensions are kept as Type 0 and facts are transactional, with the granularity defined at the transaction level.

Physical Model
<img width="616" alt="image" src="https://github.com/user-attachments/assets/c1370f3c-f274-46ed-add9-06020fee5116" />

**3]ETL Process**
ETL processes for all dimensions are developed using Azure Data Factory and executed in this phase. The process successfully loads 100% of the source data into respective facts and dimensions. Details of data consistency checks can be found in the attached PDF document.

**4]Visualizations**
Visualizations are created from the Data Warehouse schema using Tableau and Power BI. All visualizations are cross-verified using SQL commands. (attached as sql_validations.SQL file in the main repository)



