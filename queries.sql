Select * from animals where name like '%mon'; -- Path: find all animals ending with mon
Select name from animals where date_of_birth between '2016-01-01' and '2019-01-01'; -- Path: find all animals born between 2016 and 2019
Select name from animals where escape_attempts < 3 and neutered = true; -- Path: find all animals that have escape attempts less than 3 and neutered
Select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu'; -- Path: find all animals that have name Agumon or Pikachu
Select (name, escape_attempts) from animals where weight_kg > 10.5; -- Path: find all animals that have weight more than 10.5
Select * from animals where neutered = true; -- Path: find all animals that are neutered
Select * from animals where not name = 'Gabumon'; -- Path: find all animals that are not Gabumon
Select * from animals where weight_kg between 10.4 and 17.3; -- Path: find all animals that have weight between 10.4 and 17.3