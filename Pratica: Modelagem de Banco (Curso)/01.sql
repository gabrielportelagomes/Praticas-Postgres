 CREATE DATABASE curso;
 
 CREATE TABLE "students" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE
);

CREATE TABLE "classes" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"classCode" TEXT NOT NULL UNIQUE
);

CREATE TABLE "classesRecords" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"studentId" INTEGER NOT NULL,
	"classId" INTEGER NOT NULL,
	"entryDate" DATE NOT NULL DEFAULT NOW(),
	"endDate" DATE DEFAULT NULL
);

CREATE TABLE "projects" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"moduleId" INTEGER NOT NULL,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "modules" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TYPE "result" AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE "projectsRecords" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"studentId" INTEGER NOT NULL,
	"projectId" INTEGER NOT NULL,
	"date" DATE NOT NULL DEFAULT NOW(),
	type "result" NOT NULL
);

ALTER TABLE "classesRecords" ADD CONSTRAINT "classesRecords_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "classesRecords" ADD CONSTRAINT "classesRecords_fk1" FOREIGN KEY ("classId") REFERENCES "classes"("id");

ALTER TABLE "projects" ADD CONSTRAINT "projects_fk0" FOREIGN KEY ("moduleId") REFERENCES "modules"("id");

ALTER TABLE "projectsRecords" ADD CONSTRAINT "projectsRecords_fk0" FOREIGN KEY ("studentId") REFERENCES "students"("id");
ALTER TABLE "projectsRecords" ADD CONSTRAINT "projectsRecords_fk1" FOREIGN KEY ("projectId") REFERENCES "projects"("id");



