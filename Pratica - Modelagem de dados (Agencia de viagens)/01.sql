CREATE TABLE "airlines" (
	"id" serial PRIMARY KEY,,
	"abbreviation" TEXT NOT NULL,
	"name" TEXT NOT NULL
);

CREATE TABLE "flights" (
	"id" serial PRIMARY KEY,,
	"airlineId" integer NOT NULL,
	"leavinAirportId" integer NOT NULL,
	"goingAirportId" integer NOT NULL,
	"abbreviation" TEXT NOT NULL,
	"departureTime" DATE NOT NULL,
	"arrivalTime" DATE NOT NULL
);

CREATE TABLE "airports" (
	"id" serial PRIMARY KEY,
	"abbreviation" TEXT NOT NULL,
	"name" TEXT NOT NULL
);

ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("airlineId") REFERENCES "airlines"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk1" FOREIGN KEY ("leavinAirportId") REFERENCES "airports"("id");
ALTER TABLE "flights" ADD CONSTRAINT "flights_fk2" FOREIGN KEY ("goingAirportId") REFERENCES "airports"("id");




