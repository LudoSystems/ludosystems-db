-- database setup

CREATE USER ludobaum; 

CREATE DATABASE ludobaum WITH OWNER ludobaum;

\c ludobaum;

CREATE SCHEMA ludobaum AUTHORIZATION ludobaum;