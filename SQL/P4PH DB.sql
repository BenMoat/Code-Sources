CREATE SCHEMA "FGC_PROJ_HOURS_DEV" AUTHORIZATION "FGC_PROJ_HOURS_DEV",

CREATE TABLE "FGC_PROJ_HOURS_DEV"."REF_LOCATIONS" (
  "LOCATION_ID"     CHAR     (36) NOT NULL,
  "LOCATION_NAME"   VARCHAR  (50) NOT NULL,
  "CREATED_BY"      VARCHAR  (12) NOT NULL,
  "CREATED_TMS"     TIMESTAMP (3) NOT NULL DEFAULT CURRENT TIMESTAMP,
  "UPDATED_BY"      VARCHAR  (12) NULL DEFAULT NULL,
  "UPDATED_TMS"     TIMESTAMP (3) NULL DEFAULT NULL,
  "VALID_FROM_TMS"  TIMESTAMP (3) NOT NULL,
  "VALID_UNTIL_TMS" TIMESTAMP (3) NULL DEFAULT NULL,
  CONSTRAINT "PK" PRIMARY KEY ("LOCATION_ID")
);

--comment

CREATE TABLE "FGC_PROJ_HOURS_DEV"."REF_DECISIONS" (
  "DECISION_ID"     CHAR      (36) NOT NULL,
  "DECISION_NAME"   VARCHAR   (50) NOT NULL,
  "CREATED_BY"      VARCHAR   (12) NOT NULL,
  "CREATED_TMS"     TIMESTAMP  (3) NOT NULL DEFAULT CURRENT TIMESTAMP,
  "UPDATED_BY"      VARCHAR   (12) NULL DEFAULT NULL,
  "UPDATED_TMS"     TIMESTAMP  (3) NULL DEFAULT NULL,
  "VALID_FROM_TMS"  TIMESTAMP  (3) NOT NULL,
  "VALID_UNTIL_TMS" TIMESTAMP  (3) NULL DEFAULT NULL,
  CONSTRAINT "PK" PRIMARY KEY ("DECISION_ID"),
);

CREATE TABLE "FGC_PROJ_HOURS_DEV"."REQUEST_DETAILS" (
  "REQUEST_ID"         CHAR     (36) NOT NULL,
  "REQUEST_BY_ID"      VARCHAR  (12) NOT NULL,
  "REQUEST_TMS"        TIMESTAMP (3) NOT NULL,
  "LOCATION_ID"        CHAR     (36) NOT NULL,
  "EVENT_DATE"         TIMESTAMP (3) NOT NULL,
  "PROJECT_NAME"       VARCHAR (100) NOT NULL,
  "HOURS_CLAIMED"      CHAR      (5) NOT NULL,
  "EVENT_DESCRIPTION"  VARCHAR (500) NOT NULL,
  "PROJECT_MANAGER_ID" VARCHAR  (12) NOT NULL,
  CONSTRAINT "PK" PRIMARY KEY ("REQUEST_ID"),
  CONSTRAINT "FK_LOCATION_ID" FOREIGN KEY ("LOCATION_ID") REFERENCES "FGC_PROJ_HOURS_DEV"."REF_LOCATIONS" (LOCATION_ID) ON DELETE RESTRICT
);

CREATE TABLE "FGC_PROJ_HOURS_DEV"."TASK_OUTCOMES" (
  "DECISION_ID"    CHAR     (36)  NOT NULL,
  "DECISION_BY_ID" VARCHAR  (12)  NOT NULL,
  "DECISION_TMS"   TIMESTAMP (3)  NOT NULL,
  "DECISION_STAGE" VARCHAR  (40)  NOT NULL,
  "DECISION_NOTES" VARCHAR (500)  NOT NULL,
  "REQUEST_ID"     CHAR     (36)  NOT NULL,
  CONSTRAINT "PK" PRIMARY KEY ("REQUEST_ID","DECISION_ID","DECISION_BY_ID","DECISION_TMS","DECISION_STAGE"),
  CONSTRAINT "FK_REQUEST_ID" FOREIGN KEY ("REQUEST_ID") REFERENCES "FGC_PROJ_HOURS_DEV"."REQUEST_DETAILS" (REQUEST_ID) ON DELETE RESTRICT
);


GRANT ALTERIN  ON SCHEMA "FGC_PROJ_HOURS_DEV" TO USER "FGC_PROJ_HOURS_DEV" WITH GRANT OPTION;
GRANT CREATEIN ON SCHEMA "FGC_PROJ_HOURS_DEV" TO USER "FGC_PROJ_HOURS_DEV" WITH GRANT OPTION;
GRANT DROPIN   ON SCHEMA "FGC_PROJ_HOURS_DEV" TO USER "FGC_PROJ_HOURS_DEV" WITH GRANT OPTION;

COMMENT ON SCHEMA "FGC_TRAINING_DEV" IS
'This was designed to support the Payment for Project Hours business process.';
