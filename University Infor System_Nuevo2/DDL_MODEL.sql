--<ScriptOptions statementTerminator=";"/>

CREATE SCHEMA STUDENT_INFO;

ALTER TABLE "STUDENT_INFO"."GRADE" DROP CONSTRAINT "GRADE_COURSE_FK";

ALTER TABLE "STUDENT_INFO"."COURSE" DROP CONSTRAINT "COURSE_STUDENT_FK";

ALTER TABLE "STUDENT_INFO"."ACTIVITY" DROP CONSTRAINT "ACTIVIT_STUDEN_FK";

ALTER TABLE "STUDENT_INFO"."GRADE" DROP CONSTRAINT "GRADE_STUDENT_FK";

ALTER TABLE "STUDENT_INFO"."GRADE" DROP CONSTRAINT "GRADE_PK";

ALTER TABLE "STUDENT_INFO"."COURSE" DROP CONSTRAINT "COURSE_PK";

ALTER TABLE "STUDENT_INFO"."ACTIVITY" DROP CONSTRAINT "ACTIVITY_PK";

ALTER TABLE "STUDENT_INFO"."STUDENT" DROP CONSTRAINT "STUDENT_START_DATE_CK";

ALTER TABLE "STUDENT_INFO"."STUDENT" DROP CONSTRAINT "STUDENT_PK";

DROP TABLE "STUDENT_INFO"."COURSE";

DROP TABLE "STUDENT_INFO"."STUDENT";

DROP TABLE "STUDENT_INFO"."GRADE";

DROP TABLE "STUDENT_INFO"."ACTIVITY";

CREATE TABLE "STUDENT_INFO"."COURSE" (
		"DEPT_ID" CHAR(4),
		"INSTRUCTOR_ID" CHAR(5),
		"INSTRUCTOR_NAME OR NM" VARCHAR(20),
		"STUDENT_TOTAL" INTEGER,
		"COURSE_ID" CHAR(5) NOT NULL,
		"STUDENT_ID" CHAR(10) NOT NULL
	);

CREATE TABLE "STUDENT_INFO"."STUDENT" (
		"STUDENT_ID" CHAR(10) NOT NULL,
		"FIRST_NAME OR NM" VARCHAR(20) NOT NULL,
		"LAST_NAME OR NM" VARCHAR(128) NOT NULL,
		"START_DATE" DATE,
		"GRADUATION_DATE" DATE,
		"STUDENT_SSN" CHAR(11),
		"EMAIL_ADD" VARCHAR(128)
	);

CREATE TABLE "STUDENT_INFO"."GRADE" (
		"STUDENT_ID" CHAR(10) NOT NULL,
		"COURSE_ID" CHAR(8) NOT NULL,
		"SCORE_PASS_FAIL" CHAR(1) NOT NULL,
		"SCORE_TOTAL" DECIMAL(3 , 0) NOT NULL,
		"ATTRIBUTE1" CHAR(5) NOT NULL
	);

CREATE TABLE "STUDENT_INFO"."ACTIVITY" (
		"STUDENT_ID" CHAR(10) NOT NULL,
		"ACTIVITY_ID" CHAR(5) NOT NULL,
		"JOIN_DATE" DATE
	);

ALTER TABLE "STUDENT_INFO"."GRADE" ADD CONSTRAINT "GRADE_PK" PRIMARY KEY ("COURSE_ID", "STUDENT_ID", "ATTRIBUTE1");

ALTER TABLE "STUDENT_INFO"."COURSE" ADD CONSTRAINT "COURSE_PK" PRIMARY KEY ("COURSE_ID");

ALTER TABLE "STUDENT_INFO"."ACTIVITY" ADD CONSTRAINT "ACTIVITY_PK" PRIMARY KEY ("STUDENT_ID", "ACTIVITY_ID");

ALTER TABLE "STUDENT_INFO"."STUDENT" ADD CONSTRAINT "STUDENT_START_DATE_CK" CHECK (GRADUATION_DATE > START_DATE);

ALTER TABLE "STUDENT_INFO"."STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("STUDENT_ID");

ALTER TABLE "STUDENT_INFO"."GRADE" ADD CONSTRAINT "GRADE_COURSE_FK" FOREIGN KEY ("COURSE_ID")
	REFERENCES "STUDENT_INFO"."COURSE" ("COURSE_ID");

ALTER TABLE "STUDENT_INFO"."COURSE" ADD CONSTRAINT "COURSE_STUDENT_FK" FOREIGN KEY ("STUDENT_ID")
	REFERENCES "STUDENT_INFO"."STUDENT" ("STUDENT_ID");

ALTER TABLE "STUDENT_INFO"."ACTIVITY" ADD CONSTRAINT "ACTIVIT_STUDEN_FK" FOREIGN KEY ("STUDENT_ID")
	REFERENCES "STUDENT_INFO"."STUDENT" ("STUDENT_ID");

ALTER TABLE "STUDENT_INFO"."GRADE" ADD CONSTRAINT "GRADE_STUDENT_FK" FOREIGN KEY ("STUDENT_ID")
	REFERENCES "STUDENT_INFO"."STUDENT" ("STUDENT_ID");



SELECT *
FROM STUDENT_INFO.COURSE;