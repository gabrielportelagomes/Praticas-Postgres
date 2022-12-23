CREATE DATABASE movieShop;

CREATE TABLE "actors" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"movieId" INTEGER NOT NULL,
	"countryId" INTEGER NOT NULL,
	"birthDate" DATE NOT NULL
);

CREATE TYPE "gradeAttendancy" AS ENUM ('0', '1','2', '3','4', '5','6', '7','8', '9','10');


CREATE TABLE "attendancySurvey" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"rentalId" INTEGER NOT NULL,
	type "gradeAttendancy" TEXT NOT NULL
);


CREATE TABLE "categories" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL
);

CREATE TABLE "cities" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"stateId" INTEGER NOT NULL
);


CREATE TABLE "customers" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"cpf" TEXT NOT NULL UNIQUE,
	"addressId" INTEGER NOT NULL,
	"phoneId" INTEGER NOT NULL
);

CREATE TABLE "customersAddress" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"district" TEXT NOT NULL,
	"zipCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL
);

CREATE TABLE "countries" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);

CREATE TABLE "discs" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"barcode" TEXT NOT NULL UNIQUE,
	"movieId" INTEGER NOT NULL,
	"stock" INTEGER NOT NULL DEFAULT 1
);


CREATE TABLE "movies" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"title" TEXT NOT NULL,
	"categoryId" INTEGER NOT NULL
);

CREATE TYPE "gradeMovie" AS ENUM ('0', '1','2', '3','4', '5','6', '7','8', '9','10');

CREATE TABLE "movieSurvey" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"movieId" INTEGER NOT NULL,
	type "gradeMovie" TEXT NOT NULL
);

CREATE TABLE "phoneNumbers" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"number" TEXT NOT NULL
);

CREATE TABLE "rentals" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL,
	"startDate" DATE NOT NULL DEFAULT NOW(),
	"endDate" DATE DEFAULT NULL
);

CREATE TABLE "rentedDiscs" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"discId" INTEGER NOT NULL,
	"rentalId" INTEGER NOT NULL
);

CREATE TABLE "states" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"name" TEXT NOT NULL
);

ALTER TABLE "discs" ADD CONSTRAINT "discs_fk0" FOREIGN KEY ("movieId") REFERENCES "movie"("id");

ALTER TABLE "movies" ADD CONSTRAINT "movies_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("addressId") REFERENCES "customersAddress"("id");
ALTER TABLE "customers" ADD CONSTRAINT "customers_fk1" FOREIGN KEY ("phoneId") REFERENCES "phoneNumbers"("id");

ALTER TABLE "actors" ADD CONSTRAINT "actors_fk0" FOREIGN KEY ("movieId") REFERENCES "movie"("id");
ALTER TABLE "actors" ADD CONSTRAINT "actors_fk1" FOREIGN KEY ("countryId") REFERENCES "countries"("id");


ALTER TABLE "customersAddress" ADD CONSTRAINT "customersAddress_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");

ALTER TABLE "rentals" ADD CONSTRAINT "rentals_fk0" FOREIGN KEY ("customerId") REFERENCES "costumers"("id");

ALTER TABLE "rentedDiscs" ADD CONSTRAINT "rentedDiscs_fk0" FOREIGN KEY ("discId") REFERENCES "disc"("id");
ALTER TABLE "rentedDiscs" ADD CONSTRAINT "rentedDiscs_fk1" FOREIGN KEY ("rentalId") REFERENCES "rentals"("id");

ALTER TABLE "movieSurvey" ADD CONSTRAINT "movieSurvey_fk0" FOREIGN KEY ("movieId") REFERENCES "movie"("id");

ALTER TABLE "attendancySurvey" ADD CONSTRAINT "attendancySurvey_fk0" FOREIGN KEY ("rentalId") REFERENCES "rentals"("id");
