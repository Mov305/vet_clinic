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