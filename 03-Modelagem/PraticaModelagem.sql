CREATE DATABASE "drivenBank";

CREATE TABLE "customers"(
	id SERIAL NOT NULL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE "states"(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE "cities"(
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerPhones"(
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	number TEXT NOT NULL UNIQUE,
	type TEXT NOT NULL
):

CREATE TABLE "customerAdresses"(
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
	street TEXT NOT NULL,
	number INTEGER NOT NULL,
	complement TEXT DEFAULT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount"(
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"accountNumber" TEXT NOT NULL,
	agency TEXT NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE DEFAULT NULL
);

CREATE TABLE "transactions"(
	id SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	amount INTEGER NOT NULL,
	type TEXT NOT NULL,
	time TIMESTAMP NOT NULL DEFAULT NOW(),
	description TEXT,
	cancelled TEXT DEFAULT NULL
);

CREATE TABLE "creditCards"(
	id SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	name TEXT NOT NULL,
	number TEXT NOT NULL UNIQUE,
	"securityCode" TEXT NOT NULL,
	"expirationMonth" INTEGER NOT NULL,
	"expirationYear" INTEGER NOT NULL,
	password TEXT NOT NULL,
	limit INTEGER NOT NULL
);






