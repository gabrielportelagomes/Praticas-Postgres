CREATE DATABASE "travelAgency"

CREATE TABLE "airlines" (
	"id" SERIAL PRIMARY KEY,,
	"abbreviation" TEXT NOT NULL,
	"name" TEXT NOT NULL
);

CREATE TABLE "flights" (
	"id" SERIAL PRIMARY KEY,,
	"airlineId" INTEGER NOT NULL,
	"leavinAirportId" INTEGER NOT NULL,
	"goingAirportId" INTEGER NOT NULL,
	"abbreviation" TEXT NOT NULL,
	"departureTime" DATE NOT NULL,
	"arrivalTime" DATE NOT NULL
);

CREATE TABLE "airports" (
	"id" SERIAL PRIMARY KEY,
	"abbreviation" TEXT NOT NULL,
	"name" TEXT NOT NULL
);

ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("airlineId") REFERENCES "airlines"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("leavinAirportId") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("goingAirportId") REFERENCES "airports"("id");




