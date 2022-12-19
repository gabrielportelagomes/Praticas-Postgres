CREATE DATABASE modelagem;

CREATE TABLE users(
"id" SERIAL PRIMARY KEY,
"name" VARCHAR(50) NOT NULL,
"email" TEXT UNIQUE NOT NULL,
"password" TEXT NOT NULL
);

CREATE TABLE products(
"id" SERIAL PRIMARY KEY,
"name" VARCHAR(50) NOT NULL,
"category_id" INTEGER NOT NULL REFERENCES "products_categories"("id"),
"price" INTEGER NOT NULL,
"size" VARCHAR NOT NULL
);

CREATE TABLE products_image(
"id" SERIAL PRIMARY KEY,
"product_id" INTEGER NOT NULL REFERENCES "products"("id"),
"image_url" TEXT UNIQUE NOT NULL,
"main" BOOLEAN NOT NULL,
);

CREATE TABLE products_categories(
"id" SERIAL PRIMARY KEY,
"name" VARCHAR(50) NOT NULL
);

CREATE TABLE purchases(
"id" SERIAL PRIMARY KEY,
"product_id" INTEGER NOT NULL REFERENCES "products"("id"),
"user_id" INTEGER NOT NULL REFERENCES "users"("id"),
"adress_id" INTEGER NOT NULL REFERENCES "adresses"("id"),
"date" TIMESTAMP DEFAULT NOW() NOT NULL,
"status" TEXT NOT NULL
);

CREATE TABLE adresses(
"id" SERIAL PRIMARY KEY,
"user_id" INTEGER NOT NULL REFERENCES "users"("id"),
"postal_code" TEXT NOT NULL,
"adress" TEXT NOT NULL,
"number" INTEGER NOT NULL,
"complement" TEXT NOT NULL,
);