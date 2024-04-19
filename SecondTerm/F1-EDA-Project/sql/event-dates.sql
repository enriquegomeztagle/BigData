/* This query retrieves the name and date of each Grand Prix event, ordered chronologically */

/* SELECT
    EventName as `GP Name`,
    EventDate as `Date`
FROM
    events
ORDER BY
    EventDate
INTO OUTFILE 'c:\\wamp64\\tmp\\gp_names_dates.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
 */

 SELECT EventName as `GP Name`, EventDate as `Date`
 FROM events
 ORDER BY EventDate;
