-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

-- A medical center employs several doctors
-- A doctors can see many patients
-- A patient can be seen by many doctors
-- During a visit, a patient may be diagnosed to have one or more diseases.

\c medical_center;

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL

);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name VARCHAR(50) NOT NULL
);

CREATE TABLE doctors_patients 
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    CONSTRAINT fk_doctor_id FOREIGN KEY REFERENCES doctors(id),
    CONSTRAINT fk_patient_id FOREIGN KEY REFERENCES patients(id)
);

CREATE TABLE patients_diseases
(
   id SERIAL PRIMARY KEY,
   patient_id INTEGER NOT NULL,
   disease_id INTEGER NOT NULL,
   CONSTRAINT fk_patient_id FOREIGN KEY REFERENCES patients(id),
   CONSTRAINT fk_disease_id FOREIGN KEY REFERENCES diseases(id) 
);
