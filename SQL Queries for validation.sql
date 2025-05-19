select * from NYPDArrestData_Raw

select distinct law_cat_cd from NYPDArrestData_Raw


select * from NYPDArrestData_Raw where ARREST_KEY is null

SELECT 
  SUM(CASE WHEN ARREST_KEY IS NULL THEN 1 ELSE 0 END) AS missing_arrest_key,
  SUM(CASE WHEN ARREST_DATE IS NULL THEN 1 ELSE 0 END) AS missing_arrest_date,
  SUM(CASE WHEN PD_CD IS NULL THEN 1 ELSE 0 END) AS missing_pd_cd,
  SUM(CASE WHEN LAW_CAT_CD IS NULL THEN 1 ELSE 0 END) AS missing_law_cat_cd
FROM NYPDArrestData_Raw;


SELECT ARREST_KEY, COUNT(*) AS count
FROM NYPDArrestData_Raw
GROUP BY ARREST_KEY
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS invalid_dates
FROM NYPDArrestData_Raw
WHERE  ARREST_DATE > getdate();

--LAW_CODE
select distinct law_code from NYPDArrestData_Raw

SELECT count(LAW_CODE)
FROM NYPDArrestData_Raw
WHERE LAW_CODE NOT LIKE 'PL%'

--PD_CD
SELECT PD_CD
FROM NYPDArrestData_Raw
WHERE PD_CD NOT LIKE '[0-9][0-9][0-9]';

SELECT COUNT(*) AS null_or_empty_count
FROM NYPDArrestData_Raw
WHERE PD_CD IS NULL OR TRIM(PD_CD) = '';

SELECT PD_CD, COUNT(*) AS count
FROM NYPDArrestData_Raw
GROUP BY PD_CD
ORDER BY count DESC;

--KY_CD

SELECT KY_CD
FROM NYPDArrestData_Raw
WHERE LEN(KY_CD) > 3;

SELECT KY_CD
FROM NYPDArrestData_Raw
WHERE KY_CD NOT LIKE '[0-9][0-9][0-9]';

SELECT COUNT(*) AS null_or_empty_count
FROM NYPDArrestData_Raw
WHERE KY_CD IS NULL OR TRIM(KY_CD) = '';

SELECT KY_CD, COUNT(*) AS count
FROM NYPDArrestData_Raw
GROUP BY KY_CD
ORDER BY count DESC;

--LAW_CODE
SELECT COUNT(*) AS invalid_law_code_count
FROM NYPDArrestData_Raw
WHERE LAW_CODE <> TRIM(LAW_CODE)  -- Check for leading or trailing whitespaces
   OR LAW_CODE <> UPPER(LAW_CODE);  -- Check if not in uppercase

SELECT * FROM NYPDArrestData_Raw WHERE LAW_CODE IS NULL

--LAW_CAT_CODE
SELECT COUNT(*) FROM NYPDArrestData_Raw WHERE LAW_CAT_CD IS NULL

SELECT COUNT(*) AS invalid_law_cat_count
FROM NYPDArrestData_Raw
WHERE LAW_CAT_CD NOT IN ('F', 'M', 'V');

SELECT LAW_CAT_CD,OFNS_DESC
FROM NYPDArrestData_Raw
WHERE LAW_CAT_CD NOT IN ('F', 'M', 'V') OR LAW_CAT_CD IS NULL;

SELECT DISTINCT LAW_CAT_CD FROM NYPDArrestData_Raw

--ARREST_BORO
select distinct ARREST_BORO from NYPDArrestData_Raw

SELECT COUNT(*) FROM NYPDArrestData_Raw WHERE ARREST_BORO IS NULL

SELECT COUNT(*) AS invalid_law_cat_count
FROM NYPDArrestData_Raw
WHERE ARREST_BORO NOT IN ('M','B','K','Q','S');

--ARREST_PRECINCT
select distinct ARREST_PRECINCT from NYPDArrestData_Raw

SELECT COUNT(*) FROM NYPDArrestData_Raw WHERE ARREST_PRECINCT IS NULL

SELECT COUNT(ARREST_PRECINCT) AS invalid_law_cat_count
FROM NYPDArrestData_Raw
WHERE ARREST_BORO NOT IN ('M','B','K','Q','S');

--age group
select distinct AGE_GROUP from NYPDArrestData_Raw

SELECT COUNT(*) FROM NYPDArrestData_Raw WHERE ARREST_BORO IS NULL

SELECT COUNT(*) AS invalid_law_cat_count
FROM NYPDArrestData_Raw
WHERE AGE_GROUP NOT IN ('<18','18-24','25-44','65+','45-64');

--RACE
SELECT PERP_RACE FROM NYPDArrestData_Raw

SELECT COUNT(*) FROM NYPDArrestData_Raw
WHERE PERP_RACE IS NULL  -- O NULL VALUES


--X CORD
SELECT COUNT(*) FROM NYPDArrestData_Raw
WHERE X_COORD_CD IS NULL 

SELECT Latitude, Longitude
FROM NYPDArrestData_Raw
GROUP BY Latitude, Longitude
HAVING COUNT(*)


SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'ARREST_DATE'
