--"BPM SQL - Get Locations as at TMS" --> "Set SQL".
SELECT * FROM
  <#=String(tw.epv.Database_Config.schemaName_ApplicationData)#>.REF_LOCATIONS
WHERE 1=1 --The scenario/condition will always be TRUE.
  <# if ( tw.local.asAtTMS ) //Embedded JavaScript to reference the (TMS) TIMESTAMP.
    {
      #> AND VALID_FROM_TMS <= ? AND //'AND' = used for a statement with more than one condition.
      --'<=' = less than or equal to | '?'=parameterised statement; executes the same statements repeatedly.
      ( VALID_UNTIL_TMS IS NULL OR VALID_UNTIL_TMS > ? ) <# --End of JavaScript.
    }
  #>
--------------------------------------------V 2--------------------------------------------------
    SELECT * FROM
      <#=String(tw.epv.Database_Config.schemaName_ApplicationData)#>.REF_LOCATIONS
    WHERE 1=1
      <# if ( tw.local.asAtTMS )
        {
          #> AND VALID_FROM_TMS <= ? AND ( VALID_UNTIL_TMS IS NULL OR VALID_UNTIL_TMS > ? ) <#
        }
      #>
-------------------------------------------------------------------------------------------------
--Data Studio - SQL Statement to insert data into the REQUEST_DETAILS columns:
INSERT INTO FGC_PROJ_HOURS_DEV.REQUEST_DETAILS --Inserting data into table
( REQUEST_BY_ID, REQUEST_TMS, LOCATION_ID, EVENT_DATE,
  PROJECT_NAME, HOURS_CLAIMED, EVENT_DESCRIPTION, PROJECT_MANAGER_ID, REQUEST_ID ) --Columns to insert data into
VALUES (
  '600520D',                              --REQUEST_BY_ID
  '2018-04-02 11:30:00.000',              --REQUEST_TMS
  '4119b21b-f849-4666-957d-1c2358d1e7a5', --LOCATION_ID
  '2018-06-03',                           --EVENT_DATE
  'SHQ Refurb',                           --PROJECT_NAME
  '3',                                    --HOURS_CLAIMED
  'An abundance of information..',        --EVENT_DESCRIPTION
  '6002KD',                               --PROJECT_MANAGER_ID
  '9be783f8-a5d0-4e73-b5a6-25e76005c4c0'  --REQUEST_ID
  );
------------------------------------------------------------------------------------------------
--Data Studio - SQL Statement to insert data into the REF_LOCATIONS columns;
INSERT INTO FGC_PROJ_HOURS_DEV.REF_LOCATIONS
( LOCATION_ID, LOCATION_NAME, CREATED_BY, CREATED_TMS, VALID_FROM_TMS )
VALUES (
  '55846354-dd30-42c1-b348-7164c60519bf', --LOCATION_ID
  'Burwell',                              --LOCATION_NAME
  '600520D',                              --CREATED_BY
  '2018-04-02 11:30:00.0',                --CREATED_TMS
  '2018-04-02 11:30:00.0'                 --VALID_FROM_TMS
);
------------------------------------------------------------------------------------------------
--Data Studio - SQL Statement to insert data into the REF_DECISIONS columns;
INSERT INTO FGC_PROJ_HOURS_DEV.REF_DECISIONS
( DECISION_ID, DECISION_NAME, CREATED_BY, CREATED_TMS, VALID_FROM_TMS )
VALUES (
  '091a8f96-cbb3-4594-8881-72b57ed545e1', --DECISION_ID
  'Payment approved',                     --DECISION_NAME
  '60059E',                               --CREATED_BY
  '2018-04-02 11:30:00.000',              --CREATED_TMS
  '2018-10-12 16:55:00.000'               --VALID_FROM_TMS
);

