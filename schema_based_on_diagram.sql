CREATE TABLE "owners"(
    "id" INTEGER NOT NULL,
    "full_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

ALTER TABLE
    "owners"
ADD
    PRIMARY KEY("id");

CREATE TABLE "species"(
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL
);

ALTER TABLE
    "species"
ADD
    PRIMARY KEY("id");

CREATE TABLE "animals"(
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owners_id" INTEGER NOT NULL
);

CREATE INDEX "animals_owners_id_index" ON "animals"("owners_id");

CREATE INDEX "animals_species_id_index" ON "animals"("species_id");

ALTER TABLE
    "animals"
ADD
    PRIMARY KEY("id");

CREATE TABLE "vets"(
    "id" INTEGER NOT NULL,
    "name" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL,
    "age" INTEGER NOT NULL
);

ALTER TABLE
    "vets"
ADD
    PRIMARY KEY("id");

CREATE TABLE "specializations"(
    "vet_id" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL
);

CREATE INDEX "specializations_vet_id_index" ON "specializations"("vet_id");

CREATE INDEX "specializations_species_id_index" ON "specializations"("species_id");

ALTER TABLE
    "specializations"
ADD
    PRIMARY KEY("vet_id");

ALTER TABLE
    "specializations"
ADD
    PRIMARY KEY("species_id");

CREATE TABLE "visits"(
    "id" INTEGER NOT NULL,
    "vets_id" INTEGER NOT NULL,
    "animals_id" INTEGER NOT NULL,
    "date_of_visit" DATE NOT NULL
);

CREATE INDEX "visits_animals_id_index" ON "visits"("animals_id");

CREATE INDEX "visits_vets_id_index" ON "visits"("vets_id");

ALTER TABLE
    "visits"
ADD
    PRIMARY KEY("id");

ALTER TABLE
    "animals"
ADD
    CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");

ALTER TABLE
    "animals"
ADD
    CONSTRAINT "animals_owners_id_foreign" FOREIGN KEY("owners_id") REFERENCES "owners"("id");

ALTER TABLE
    "visits"
ADD
    CONSTRAINT "visits_vets_id_foreign" FOREIGN KEY("vets_id") REFERENCES "vets"("id");

ALTER TABLE
    "visits"
ADD
    CONSTRAINT "visits_animals_id_foreign" FOREIGN KEY("animals_id") REFERENCES "animals"("id");