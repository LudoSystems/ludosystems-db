-- database setup on postgres connection

-- use CREATE USER ludosystems WITH PASSWORD '...' if using this anywhere except development!
CREATE USER ludosystems;

CREATE DATABASE ludosystems WITH OWNER ludosystems;