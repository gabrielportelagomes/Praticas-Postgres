CREATE DATABASE modelagem_integridade;

CREATE TABLE customers(
"id" SERIAL PRIMARY KEY,
"fullName" TEXT NOT NULL,
"cpf" TEXT NOT NULL UNIQUE,
"email" TEXT NOT NULL UNIQUE, 
"password" TEXT NOT NULL,
);

CREATE TABLE customerAddresses(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"street" TEXT NOT NULL ,
"number" TEXT NOT NULL ,
"complement" TEXT NOT NULL ,
"postalCode" TEXT NOT NULL ,
"cityId" TEXT NOT NULL ,
);

CREATE TABLE cities(
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL,
"stateId" INTEGER NOT NULL REFERENCES "states"("id"),
);

CREATE TABLE states(
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL,
);

CREATE TABLE customerPhone(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"number" TEXT NOT NULL,
"type" TEXT NOT NULL,
);

CREATE TABLE bankAccount(
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"accountNumber" TEXT NOT NULL,
"agency" TEXT NOT NULL,
"openDate" DATE NOT NULL DEFAULT NOW(),
"closeDate" DATE NOT NULL,
);

CREATE TABLE transactions(
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"amount" INTEGER NOT NULL,
"type"  TEXT NOT NULL,
"time" TIMESTAMP NOT NULL DEFAULT NOW(),
"description"  TEXT NOT NULL,
"cancelled" BOOLEAN NOT NULL DEFAULT FALSE,
);

CREATE TABLE creditCards(
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"name" TEXT NOT NULL, 
"number" TEXT NOT NULL,
"securityCode" TEXT NOT NULL,
"expirationMonth" DATE NOT NULL,
"expirationYear" DATE NOT NULL,
"password" TEXT NOT NULL,
"limit" INTEGER NOT NULL,
);