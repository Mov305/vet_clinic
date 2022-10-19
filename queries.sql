Select * from animals where name like '%mon'; -- Path: find all animals ending with mon
Select name from animals where date_of_birth between '2016-01-01' and '2019-01-01'; -- Path: find all animals born between 2016 and 2019
Select name from animals where escape_attempts < 3 and neutered = true; -- Path: find all animals that have escape attempts less than 3 and neutered
Select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu'; -- Path: find all animals that have name Agumon or Pikachu
Select (name, escape_attempts) from animals where weight_kg > 10.5; -- Path: find all animals that have weight more than 10.5
Select * from animals where neutered = true; -- Path: find all animals that are neutered
Select * from animals where not name = 'Gabumon'; -- Path: find all animals that are not Gabumon
Select * from animals where weight_kg between 10.4 and 17.3; -- Path: find all animals that have weight between 10.4 and 17.3


Begin;
Update animals set species = 'digimon' where name like '%mon'; -- Path: update all animals that have name ending with mon to be digimon
Update animals set species = 'pokemon' where name not like '%mon'; -- Path: update all the rest of the animals
Commit;

Select * from animals;

Begin;
Delete from animals; -- Path: delete all animals
Rollback;

Begin;
Savepoint savepoint1;
Delete from animals where date_of_birth > '2022-01-01'; -- Path: delete all animals born after 2022
Rollback to savepoint1;
Update animals set weight_kg = weight_kg * -1;
Update animals set weight_kg = weight_kg * -1;
Commit;

Select Count(name) from animals; -- Path: count all animals
Select Count(name) from animals where escape_attempts = 0; -- Path: count all animals that have 0 escape attempts
Select Avg(weight_kg) from animals; -- Path: find the average weight of animals
Select Max(escape_attempts) from animals Group by neutered; -- Path: find the max escape attempts of all animals
Select Min(weight_kg), Max(weight_kg) from animals Group by species; -- Path: find the min and max weight of each species
Select Avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-01-01' Group by species; -- Path: find the average escape attempts of all animals born between 1990 and 2000

