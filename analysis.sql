


# 1) 
#standardsql
SELECT
  *
FROM
  `flights.tzcorr`
LIMIT
  10


# 2) evaluate if date is train date 
#standardsql
 SELECT
   FL_DATE,
   IF(MOD(ABS(FARM_FINGERPRINT(CAST(FL_DATE AS STRING))), 100) < 70, 'True', 'False') AS is_train_day
 FROM (
   SELECT
     DISTINCT(FL_DATE) AS FL_DATE
   FROM
     `flights.tzcorr`)
 ORDER BY
   FL_DATE



