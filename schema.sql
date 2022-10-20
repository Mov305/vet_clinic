CREATE TABLE IF NOT EXISTS owners (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1
    ),
    full_name text COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS species (
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1
    ),
    name text COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS animals(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY (
        INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1
    ),
    name text COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer,
    CONSTRAINT animals_pkey PRIMARY KEY (id),
    CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE
    SET
        NULL,
        CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE
    SET
        NULL
);

CREATE TABLE IF NOT EXISTS vets (
    id integer GENERATED ALWAYS AS IDENTITY,
    name text,
    age integer,
    date_of_graduation date,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS specializations (
    vet_id integer ,
    species_id integer,
    CONSTRAINT specializations_pkey PRIMARY KEY (vet_id, species_id),
    CONSTRAINT vet_id FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE,
    CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS visits (
    animal_id integer ,
    vet_id integer ,
    date_of_visit date,
    CONSTRAINT visits_pkey PRIMARY KEY (animal_id, vet_id, date_of_visit),
    CONSTRAINT animal_id FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE,
    CONSTRAINT vet_id FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE
);
